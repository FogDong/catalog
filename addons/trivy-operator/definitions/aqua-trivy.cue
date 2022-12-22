import (
	"vela/op"
	"vela/ql"
	"strings"
	"encoding/yaml"
)

"trivy-check": {
	type: "workflow-step"
	annotations: {
		"definition.oam.dev/example-url":         "https://raw.githubusercontent.com/kubevela/catalog/master/examples/trivy-operator/trivy-check-example.yaml"
		"addon.oam.dev/ignore-without-component": "aqua-trivy-system-helm"
	}
	labels: {}
	description: ""
}
template: {
	findResource: op.#Steps & {
		resourceType: *parameter.resource.type | string
		resourceName: *parameter.resource.name | string
		if parameter.resource.type == "Deployment" {
			deployment: op.#Read & {
				value: {
					apiVersion: "apps/v1"
					kind:       "Deployment"
					metadata: {
						name:      parameter.resource.name
						namespace: context.namespace
					}
				}
			}
			rs: op.#List & {
				resource: {
					apiVersion: "apps/v1"
					kind:       "ReplicaSet"
				}
				filter: {
					namespace:      context.namespace
					matchingLabels: deployment.value.spec.selector.matchLabels
				}
			}
			resourceType: "ReplicaSet"
			if rs.list != _|_ {
				if rs.list.items != _|_ {
					if len(rs.list.items) > 0 {
						resourceName: rs.list.items[0].metadata.name
					}
				}
			}
		}
	}

	findVulns: op.#Steps & {
		scanPod: op.#List & {
			resource: {
				apiVersion: "v1"
				kind:       "Pod"
			}
			filter: {
				namespace: "trivy-system"
				matchingLabels: {
					"trivy-operator.resource.kind": findResource.resourceType
					"trivy-operator.resource.name": findResource.resourceName
				}
			}
		}
		wait: op.#ConditionalWait & {
			continue: len(scanPod.list.items) == 0
		}
		vulns: op.#List & {
			resource: {
				apiVersion: "aquasecurity.github.io/v1alpha1"
				kind:       "VulnerabilityReport"
			}
			filter: {
				namespace: context.namespace
				matchingLabels: {
					"trivy-operator.resource.kind": findResource.resourceType
					"trivy-operator.resource.name": findResource.resourceName
				}
			}
		}
	}

	trivyLevel: strings.Join(parameter.level, ",")
	result: {
		report: {...}
		if findVulns.vulns.list != _|_ && findVulns.vulns.list.items != _|_ for v in findVulns.vulns.list.items {
			report: "\(v.report.artifact.repository):\(v.report.artifact.tag)": {
				summary: v.report.summary
				if parameter.showDetail {
					details: [ for vul in v.report.vulnerabilities if strings.Contains(trivyLevel, vul.severity) {
						"\(vul.severity) \(vul.vulnerabilityID)": {
							link:     vul.primaryLink
							title:    vul.title
							resource: vul.resource
						}
					}]
				}
			}
		}

		if len(report) > 0 {
			message: "Trivy Scan Result: \n\n" + yaml.Marshal(report)
		}
		if len(report) == 0 {
			message: "No vulnerability found for \(findResource.resourceType) \(findResource.resourceName)"
		}
	}
	parameter: {
		level:      *["CRITICAL"] | [...string]
		showDetail: *true | bool
		resource: {
			type: *"Deployment" | "ReplicaSet" | "Job" | "Pod" | "DaemonSet" | string
			name: string
		}
	}
}
