module "first-iam-user" {
    source      = "./modules/iam"
    iam_name    = "example1"
}

module "second-iam-user" {
    source        = "./modules/iam"
    iam_name      = "example2"
}