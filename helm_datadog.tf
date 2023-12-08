provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "datadog_agent" {
  name       = "datadog-agent"
  chart      = "datadog"
  repository = "https://helm.datadoghq.com"
  version    = "3.49.7"
  namespace  = kubernetes_namespace.beacon.id

# Use this to reference the custom yaml file with our unique
# settings to be changed from defaults.
#  values = [
#    file("datadog.values.yml"),
#    templatefile("${path.root}/templates/datadog.env.yml.tpl", {
#      region       = local.region
#      cluster_name = var.cluster_name
#    })
#  ]

  set_sensitive {
    name  = "datadog.apiKey"
    value = var.datadog_api_key
  }

  set {
    name  = "datadog.site"
    value = var.datadog_site
  }

  ## Enable logs agent and provide custom configs
  # datadog.logs.enabled -- Enables this to activate Datadog Agent log collection
  set {
    name  = "datadog.logs.enabled"
    value = false
  }

  # datadog.logs.containerCollectAll -- Enable this to allow log collection for all containers
  ## ref: https://docs.datadoghq.com/agent/basic_agent_usage/kubernetes/#log-collection-setup
  set {
    name  = "datadog.logs.containerCollectAll"
    value = false
  }

  ## ref: https://docs.datadoghq.com/agent/kubernetes/dogstatsd/
  # To emit custom metrics from your Kubernetes application, use DogStatsD.
  # datadog.dogstatsd.port -- Override the Agent DogStatsD port
  # datadog.dogstatsd.useHostPort -- Sets the hostPort to the same value of the container port
  set {
    name  = "datadog.dogstatsd.useHostPort"
    value = true
  }

  # datadog.systemProbe.enableTCPQueueLength -- Enable the TCP queue length eBPF-based check
  set {
    name  = "systemProbe.enableTCPQueueLength"
    value = true
  }

  ## Enable systemProbe agent and provide custom configs
  # datadog.systemProbe.enableOOMKill -- Enable the OOM kill eBPF-based check
  set {
    name  = "systemProbe.enableOOMKill"
    value = true
  }
}
