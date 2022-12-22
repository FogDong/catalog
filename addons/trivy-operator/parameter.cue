parameter: {
	// +usage=Deploy to specified clusters. Leave empty to deploy to all clusters.
	clusters?: [...string]

	// +usage=Namespace to deploy to, defaults to cert-manager
	namespace: *"trivy-system" | string

	// +usage=Specify the type for the trivy operator
	type: *"aqua" | "devop"

	devop: {
		// +usage=Specify if persistent storage (pv) is enabled or not, no persistent storage when false
		enabled: *false | bool

		// +usage=Specify the crontab for trivy-operator to scanning image in labled namespace
		crontab: *"*/5 * * * *" | string
	}
}
