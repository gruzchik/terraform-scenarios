resource "aws_iam_role" "iam_module_role" {
  name = var.iam_name
  assume_role_policy = data.aws_iam_policy_document.trust_policy.json
}

data "aws_iam_policy_document" "trust_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# resource "aws_iam_role_policy_attachment" "role_access" {
#   role       = "${aws_iam_role.iam_module_role.name}"
#   policy_arn = "${aws_iam_policy.role-access.arn}"
# }

resource "aws_iam_role_policy_attachment" "s3_access" {
  count      = length(var.s3_buckets) > 0 ? 1 : 0
  role       = "${aws_iam_role.iam_module_role.name}"
  policy_arn = "${aws_iam_policy.s3_access_policy[count.index].arn}"
}

resource "aws_iam_role_policy_attachment" "dynamodb_access" {
  count      = length(var.dynamodb_read) > 0 ? 1 : 0
  role       = "${aws_iam_role.iam_module_role.name}"
  policy_arn = "${aws_iam_policy.dynamodb_read_policy[count.index].arn}"
}

// S3 buckets Read Policy
data "aws_iam_policy_document" "s3_access_policy_document" {
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]
    resources = var.s3_buckets
 }
}

// Dynamodb table Read Policy
data "aws_iam_policy_document" "dynamodb_read_policy_document" {
  statement {
    effect = "Allow"
    actions = [
      "dynamodb:DescribeTable",
      "dynamodb:GetItem",
      "dynamodb:GetRecords",
      "dynamodb:ListTables",
      "dynamodb:Query",
      "dynamodb:Scan",
    ]
    resources = var.dynamodb_read
  }
}

resource "aws_iam_policy" "s3_access_policy" {
  count      = length(var.s3_buckets) > 0 ? 1 : 0
  name       = "${var.iam_name}-s3-policy"
  policy     = data.aws_iam_policy_document.s3_access_policy_document.json
}

resource "aws_iam_policy" "dynamodb_read_policy" {
  count      = length(var.dynamodb_read) > 0 ? 1 : 0
  name       = "${var.iam_name}-dynamodb-read-policy"
  policy     = data.aws_iam_policy_document.dynamodb_read_policy_document.json
}