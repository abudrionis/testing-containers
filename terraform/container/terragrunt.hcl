terraform {
  #source = "git::https://${get_env("GITHUB_TOKEN")}@github.com/Pivigo/AIaaS_deployment_infrastructure.git//deploy_container?ref=v1.9"
  source = "/Volumes/Storage/data_science/Pivigo/terraform/AIaaS_deployment_infrastructure//deploy_container"
}

dependency "network" {
  config_path = "../network"
  skip_outputs = true
}

include {
  path = find_in_parent_folders()
}
