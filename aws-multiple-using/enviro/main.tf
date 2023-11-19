module "first-iam-user" {
    source      = "./modules/iam"
    iam_name    = "examplerole1"
    s3_buckets  = [
        "arn:aws:s3:::tf-s3-bucket-name1-example1",
        "arn:aws:s3:::tf-s3-bucket-name2-example1",
    ]
}

module "second-iam-user" {
    source        = "./modules/iam"
    iam_name      = "examplerole2"
    dynamodb_read = [
        "arn:aws:dynamodb:*:*:table/tf-test-table1-example2",
        "arn:aws:dynamodb:*:*:table/tf-test-table2-example2",
    ]
}