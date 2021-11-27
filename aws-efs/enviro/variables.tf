variable "awsprops" {
  type = map(string)

  default = {
    region       = "us-east-1"
    ami          = "ami-04902260ca3d33422"
    itype        = "t2.micro"
    keyname      = "testuser-ssh-key"
    secgroupname = "ec2_sg"
    publicip     = true
  }
}
