provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "datadog_agent" {
  name       = "datadog-agent"
  chart      = "datadog"
  repository = "https://helm.datadoghq.com"
  version    = "3.49.0"
  namespace  = kubernetes_namespace.beacon.id

  set_sensitive {
    name  = "datadog.apiKey"
    value = var.datadog_api_key
  }

  set {
    name  = "datadog.site"
    value = var.datadog_site
  }

  set {
    name  = "fips.enabled"
    value =  true
  }

  set {
    name  = "fips.use_https"
    value =  false
  }

  set {
    name  = "datadog.logs.enabled"
    value = false
  }

  set {
    name  = "datadog.apm.portEnabled"
    value = true
  }

  set {
    name  = "datadog.logs.containerCollectAll"
    value = true
  }

  set {
    name  = "datadog.leaderElection"
    value = true
  }

  set {
    name  = "datadog.collectEvents"
    value = true
  }

  set {
    name  = "clusterAgent.enabled"
    value = true
  }

  set {
    name  = "clusterAgent.metricsProvider.enabled"
    value = true
  }

  set {
    name  = "datadog.networkMonitoring.enabled"
    value = true
  }

  set {
    name  = "datadog.processAgent.enabled"
    value = true
  }

  set {
    name  = "datadog.processAgent.processCollection"
    value = true
  }

  set {
    name  = "datadog.dogstatsd.useHostPort"
    value = true
  }

  set {
    name  = "systemProbe.enableTCPQueueLength"
    value = true
  }

  set {
    name  = "systemProbe.enableOOMKill"
    value = true
  }

  set {
    name  = "securityAgent.runtime.enabled"
    value = true
  }

  set {
    name  = "datadog.hostVolumeMountPropagation"
    value = "HostToContainer"
  }

  set {
    name  = "datadog.serviceMonitoring.enabled"
    value =  true
  }

  set {
    name  = "datadog.kubeStateMetricsCore.enabled"
    value =  true
  }

  set {
    name  = "datadog.kubeStateMetricsEnabled"
    value =  false
  }

  set {
    name  = "datadog.kubelet.tlsVerify"
    value =  false
  }

  set {
    name  = "clusterAgent.admissionController.enabled"
    value =  true
  }

  set {
    name  = "clusterAgent.admissionController.mutateUnlabelled"
    value =  false
  }

  set {
    name  = "agents.useConfigMap"
    value =  true
  }

  set {
    name  = "agents.customAgentConfig"
    value =  true
  }
}
