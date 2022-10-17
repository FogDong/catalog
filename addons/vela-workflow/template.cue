package main

output: {
	apiVersion: "core.oam.dev/v1beta1"
	kind:       "Application"
	metadata: {
		name:      const.name
		namespace: parameter.namespace
	}
	spec: {
		components: [
			{
				name: "workflow-helm"
				type: "helm"
				properties: {
					repoType:        "helm"
					url:             "https://charts.kubevela.net/core"
					chart:           "vela-workflow"
					version:         "0.2"
					targetNamespace: parameter.namespace
					releaseName:     "vela-workflow"
				}
			},
		]
	}
}
