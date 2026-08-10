[1mdiff --git a/eks/eks.tf b/eks/eks.tf[m
[1mindex c3214f4..7dab784 100644[m
[1m--- a/eks/eks.tf[m
[1m+++ b/eks/eks.tf[m
[36m@@ -13,7 +13,7 @@[m [mmodule "eks" {[m
   addons = {[m
     vpc-cni = {[m
       most_recent    = true[m
[31m-      before_compute = true   # install CNI before the node group comes up[m
[32m+[m[32m      before_compute = true # install CNI before the node group comes up[m[41m[m
     }[m
     kube-proxy = {[m
       most_recent = true[m
[1mdiff --git a/main.tf b/main.tf[m
[1mindex 49ab5ae..9ebbf93 100644[m
[1m--- a/main.tf[m
[1m+++ b/main.tf[m
[36m@@ -12,8 +12,8 @@[m [mmodule "iam" {[m
 }[m
 [m
 module "compute" {[m
[31m-  source                 = "./modules/compute"[m
[31m-  subnet_id              = module.network.subnet_id[m
[31m-  security_group_id      = module.security.security_group_id[m
[31m-  instance_profile_name  = module.iam.instance_profile_name[m
[32m+[m[32m  source                = "./modules/compute"[m[41m[m
[32m+[m[32m  subnet_id             = module.network.subnet_id[m[41m[m
[32m+[m[32m  security_group_id     = module.security.security_group_id[m[41m[m
[32m+[m[32m  instance_profile_name = module.iam.instance_profile_name[m[41m[m
 }[m
\ No newline at end of file[m
[1mdiff --git a/providers.tf b/providers.tf[m
[1mindex 3866d5b..20496e8 100644[m
[1m--- a/providers.tf[m
[1m+++ b/providers.tf[m
[36m@@ -23,14 +23,14 @@[m [mterraform {[m
   }[m
 [m
   backend "s3" {[m
[31m-    bucket         = "terraform-learning-state-048280526216"[m
[31m-    key            = "terraform-learning/terraform.tfstate"[m
[31m-    region         = "us-west-2"[m
[31m-    use_lockfile   = true[m
[31m-    encrypt        = true[m
[32m+[m[32m    bucket       = "terraform-learning-state-048280526216"[m[41m[m
[32m+[m[32m    key          = "terraform-learning/terraform.tfstate"[m[41m[m
[32m+[m[32m    region       = "us-west-2"[m[41m[m
[32m+[m[32m    use_lockfile = true[m[41m[m
[32m+[m[32m    encrypt      = true[m[41m[m
   }[m
 }[m
 [m
 provider "aws" {[m
   region = "us-west-2"[m
[31m-}# trigger workflow test[m
[32m+[m[32m} # trigger workflow test[m
