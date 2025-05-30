## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "dasmeta/grafana/onpremise"
  version = "1.17.0"

  alerts = {"rules":[{"datasource":"prometheus","equation":"gt","expr":"sum(rate(container_cpu_usage_seconds_total{namespace=\\\"demo\\\",pod=~\\\"frontend.*\\\"}[5m]))","function":"Last","name":"Frontend High CPU Alert","threshold":95}]}
  application_dashboard = {"data_source":{"type":"prometheus","uid":"prometheus"},"rows":[{"name":"SLA","type":"block/sla"},{"load_balancer_arn":"arn:aws:elasticloadbalancing:eu-central-1:091947912116:loadbalancer/app/prod-ingress/fe7376c7ea9e4e2c","name":"ALB","region":"eu-central-1","type":"block/alb_ingress"},{"name":"Cloudwatch Metrics","region":"eu-central-1","type":"block/cloudwatch"},{"name":"backend-strapi","type":"block/service"},{"name":"frontend","type":"block/service"}],"variables":[{"name":"namespace","options":[{"selected":true,"value":"demo"},{"value":"demo"}]}]}
  aws_region = "eu-central-1"
  cluster_name = "eks-prod"
  grafana_admin_password = "password"
  grafana_configs = {"datasources":[{"name":"cloudwatch","type":"cloudwatch"}],"ingress":{"annotations":{"alb.ingress.kubernetes.io/group.name":"prod-ingress"},"hosts":["grafana.demo.dasmeta.com"]},"persistence":{"enabled":true,"size":"10Gi","storage_class":"gp2"},"redundency":{"enabled":false},"resources":{"limits":{"cpu":"1","mem":"2Gi"},"request":{"cpu":"1","mem":"2Gi"}}}
  loki_configs = {"enabled":true}
  name = "demo-prod-grafana"
  prometheus_configs = {"enabled":true,"replicas":1,"resources":{"limit":{"cpu":"1500m","mem":"1.5Gi"},"request":{"cpu":"1","mem":"1Gi"}},"storage_class":"gp2","storage_size":"10Gi"}
  tempo_configs = {"enabled":false}
  providers = {"aws":"aws","kubernetes":"kubernetes"}
}


data "tfe_outputs" "this" {
  for_each = { for workspace in ["1-environments/prod/eks"] : workspace => workspace }

  organization = "Demo-Infrastructure"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}
