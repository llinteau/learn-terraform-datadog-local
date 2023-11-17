provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "datadog_agent" {
  name       = "datadog-agent"
  chart      = "datadog"
  repository = "https://helm.datadoghq.com"
  version    = "3.10.9"
  namespace  = kubernetes_namespace.beacon.id
  
  set_sensitive {
    name  = "datadog.apiKey"
    value = var.datadog_api_key
  }

  set {
    name  = "datadog.site"
    value = var.datadog_site
  }

#  FIPS provides encryption. This is mandatory for ATO
#  set {
#    name  = "fips.enabled"
#    value =  true
#  }

#  FIPS provides encryption. This is mandatory for ATO
#  set {
#    name  = "fips.use_https"
#    value =  false
#  }

#  Logs are not allowed now but will be considered later. 
  set {
    name  = "datadog.logs.enabled"
    value = false
  }

#  Logs are not allowed now but will be considered later. Logging for Containers
  set {
    name  = "datadog.logs.containerCollectAll"
    value = true
  }

#  Baseline Application monitoring
  set {
    name  = "datadog.apm.portEnabled"
    value = true
  }

#  Enables leader election mechanism for event collection
  set {
    name  = "datadog.leaderElection"
    value = true
  }

#  Enables this to start event collection from the kubernetes API
  set {
    name  = "datadog.collectEvents"
    value = true
  }

## This is the Datadog Cluster Agent implementation that handles cluster-wide
## metrics more cleanly, separates concerns for better rbac, and implements
## the external metrics API so you can autoscale HPAs based on datadog metrics
## ref: https://docs.datadoghq.com/containers/cluster_agent/ 
  set {
    name  = "clusterAgent.enabled"
    value = true
  }


# Enable the metricsProvider to be able to scale based on metrics in Datadog
  set {
    name  = "clusterAgent.metricsProvider.enabled"
    value = true
  }


# Enable network performance monitoring
  set {
    name  = "datadog.networkMonitoring.enabled"
    value = true
  }


# Enable live process monitoring agent
  set {
    name  = "datadog.processAgent.enabled"
    value = true
  }

## Note: /etc/passwd is automatically mounted when `processCollection` or `processDiscovery` is enabled.
## ref: https://docs.datadoghq.com/graphing/infrastructure/process/#kubernetes-daemonset
#  Enable process collection in process monitoring agent
  set {
    name  = "datadog.processAgent.processCollection"
    value = true
  }


## ref: https://docs.datadoghq.com/agent/kubernetes/dogstatsd/
## To emit custom metrics from your Kubernetes application, use DogStatsD.
  set {
    name  = "datadog.dogstatsd.port"
    value = "8125"
  }

# Sets the hostPort to the same value of the container port
  set {
    name  = "datadog.dogstatsd.useHostPort"
    value = true
  }


  set {
    name  = "datadog.dogstatsd.nonLocalTraffic"
    value = "true"
  }

# Enable the TCP queue length eBPF-based check
  set {
    name  = "systemProbe.enableTCPQueueLength"
    value = true
  }

# Enable the OOM kill eBPF-based check
  set {
    name  = "systemProbe.enableOOMKill"
    value = true
  }

# Set to true to enable Cloud Workload Security (CWS)
  set {
    name  = "securityAgent.runtime.enabled"
    value = true
  }


# Allow to specify the `mountPropagation` value on all volumeMounts using HostPath
## ref: https://kubernetes.io/docs/concepts/storage/volumes/#mount-propagation
  set {
    name  = "datadog.hostVolumeMountPropagation"
    value = "HostToContainer"
  }

# Enable Universal Service Monitoring
  set {
    name  = "datadog.serviceMonitoring.enabled"
    value =  true
  }


# Enable the kubernetes_state_core check in the Cluster Agent (Requires Cluster Agent 1.12.0+)
  set {
    name  = "datadog.kubeStateMetricsCore.enabled"
    value =  true
  }


# deploys the kube-state-metrics deployment
## ref: https://github.com/kubernetes/kube-state-metrics/tree/kube-state-metrics-helm-chart-2.13.2/charts/kube-state-metrics
# The kubeStateMetricsEnabled option will be removed in the 4.0 version of the Datadog Agent chart.
  set {
    name  = "datadog.kubeStateMetricsEnabled"
    value =  false
  }

# Toggle kubelet TLS verification
  set {
    name  = "datadog.kubelet.tlsVerify"
    value =  false
  }

# Enable the admissionController to be able to inject APM/Dogstatsd 
# config and standard tags (env, service, version) automatically into your pods
  set {
    name  = "clusterAgent.admissionController.enabled"
    value =  true
  }

# Enable injecting config without having the pod label 'admission.datadoghq.com/enabled="true"'
  set {
    name  = "clusterAgent.admissionController.mutateUnlabelled"
    value =  false
  }

# Configures a configmap to provide the agent configuration. Use this in combination with 
# the `agents.customAgentConfig` parameter.
  set {
    name  = "agents.useConfigMap"
    value =  true
  }

# Specify custom contents for the datadog agent config (datadog.yaml)
  ## ref: https://docs.datadoghq.com/agent/guide/agent-configuration-files/?tab=agentv6
  ## ref: https://github.com/DataDog/datadog-agent/blob/main/pkg/config/config_template.yaml
  ## Note the `agents.useConfigMap` needs to be set to `true` for this parameter to be taken into account.
#  https://github.com/DataDog/helm-charts/blob/main/charts/datadog/values.yaml#L1720
  set {
    name  = "agents.customAgentConfig"
    value =  true
  }
}
