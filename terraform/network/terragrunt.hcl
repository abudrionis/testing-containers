terraform {
  #source = "git::https://${get_env("GITHUB_TOKEN")}@github.com/Pivigo/AIaaS_deployment_infrastructure.git//network?ref=v1.9"
  source = "/Volumes/Storage/data_science/Pivigo/terraform/AIaaS_deployment_infrastructure//network"
}

include {
  path = find_in_parent_folders()
}
