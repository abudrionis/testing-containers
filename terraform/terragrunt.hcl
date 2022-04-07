locals {
  region = "eu-west-2"
  env = "test"
  network_name = "plat-165"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "${local.network_name}-${local.env}-${local.region}"
    key            = "env:/${local.env}/${local.network_name}/${path_relative_to_include()}.tfstate"
    region         = local.region
    encrypt        = true
    dynamodb_table = "${local.network_name}-${local.env}-${local.region}-lock"
  }
}

inputs = {
  #configs for ECS service
  environment = local.env
  region = local.region
  network_name = local.network_name
  enable_https = true
  enable_cognito = false
  load_balancer_url = "plat-165.test.pivigo.net"
  dns_zone = "test.pivigo.net"
  container_tag = "${get_env("TF_VAR_model_image_tag")}"
  name = "${local.network_name}"
  container_port = 80
  service_desired_count = 1
  container_min_capacity = 1
  container_max_capacity = 1
  container_cpu = 512
  container_memory = 1024
  health_check_path = "/health"
  cidr_whitelist = ["188.33.248.67/32", "77.16.64.243/32"]

  
  #configs for an OPTIONAL async ECS task. If async task is not required, the lines below can be deleted.
  enable_ecs_async = true
  enable_ecs_async_scheduling = true
  
  #default settings can be overridden by setting the following variables to desired values:
  async_container_port = 8080
  async_container_tag = "latest"
  async_container_desired_count = 1
  async_container_max_capacity = 1
  async_container_cpu =  256
  async_container_memory = 512
  event_rule_schedule_expression = "rate(5 minutes)"
}
