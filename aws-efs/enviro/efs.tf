resource "aws_efs_file_system" "efs-engx" {
  creation_token   = "efs-example"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = "true"

  tags = {
    Name = "EfsExample"
  }
}

resource "aws_efs_mount_target" "efs-mt-engx-us-east1a" {
  file_system_id  = "${aws_efs_file_system.efs-engx.id}"
  subnet_id       = "${aws_subnet.subnet-efs-us-east-1a.id}"
  security_groups = ["${aws_security_group.efs_sg.id}"]
}

resource "aws_efs_mount_target" "efs-mt-engx-us-east1b" {
  file_system_id  = "${aws_efs_file_system.efs-engx.id}"
  subnet_id       = "${aws_subnet.subnet-efs-us-east-1b.id}"
  security_groups = ["${aws_security_group.efs_sg.id}"]
}

resource "aws_efs_mount_target" "efs-mt-engx-us-east1c" {
  file_system_id  = "${aws_efs_file_system.efs-engx.id}"
  subnet_id       = "${aws_subnet.subnet-efs-us-east-1c.id}"
  security_groups = ["${aws_security_group.efs_sg.id}"]
}
