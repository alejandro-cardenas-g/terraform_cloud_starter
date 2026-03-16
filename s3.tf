resource "aws_s3_bucket" "projectX_bucket" {
    bucket = "${local.s3-sufix}-mybycket"
}