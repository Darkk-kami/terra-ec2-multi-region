module "region_1" {
  source = "./region"
  region = "us-east-1"
}

module "region_2" {
  source = "./region"
  region = "us-east-2"
}

module "region_3" {
  source = "./region"
  region = "us-west-1"
}

module "region_4" {
  source = "./region"
  region = "us-west-2"
}

module "region_5" {
  source = "./region"
  region = "eu-west-1"
}

module "region_6" {
  source = "./region"
  region = "eu-west-2"
}

module "region_7" {
  source = "./region"
  region = "eu-west-3"
}

locals {
  modules = {
    "us-east-1" = module.region_1.servers
    "us-east-2" = module.region_2.servers
    "us-west-1" = module.region_3.servers
    "us-west-2" = module.region_4.servers
    "eu-west-1" = module.region_5.servers
    "eu-west-2" = module.region_6.servers
    "eu-west-3" = module.region_7.servers
  }
}
