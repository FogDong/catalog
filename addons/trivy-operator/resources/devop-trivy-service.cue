package main

devopTrivyHelm: {
	name: "devop-trivy-system-helm"
	dependsOn: ["trivy-system-ns"]
	type: "helm"

	properties: {
		repoType:        "helm"
		url:             "https://devopstales.github.io/helm-charts"
		chart:           "trivy-operator"
		version:         "2.4.3"
		targetNamespace: parameter.namespace
		values: {
			image: {
				repository: "https://devopstales.github.io/helm-charts"
				tag:        "2.4.3"
			}

			persistence: {
				enabled: parameter.devop.enabled
			}

			namespaceScanner: {
				crontab: parameter.devop.crontab
			}

		}
	}
	traits: [{
		type: "prometheus-scrape"
		properties: {
			port: 9115
			selector: {
				app:                          "trivy-operator"
				"app.kubernetes.io/instance": "trivy-system-trivy-system-helm"
				"app.kubernetes.io/name":     "trivy-operator"
			}
			type: "ClusterIP"
		}
	}]
}
