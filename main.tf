
module "region_1" {
  source = "./region"
  region = "us-east-1"
}

module "region_2" {
  source = "./region"
  region = "us-east-2"
}

locals {
  modules = {
    "us-east-1" = module.region_1.servers
    "us-east-2" = module.region_2.servers
  }
}