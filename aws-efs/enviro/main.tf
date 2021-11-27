resource "aws_instance" "project-iac" {
  ami = lookup(var.awsprops, "ami")
  instance_type = lookup(var.awsprops, "itype")
  subnet_id = aws_subnet.subnet-efs-us-east-1c.id
  associate_public_ip_address = lookup(var.awsprops, "publicip")
  key_name = lookup(var.awsprops, "keyname")


  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]
  root_block_device {
    delete_on_termination = true
    volume_size = 8
    volume_type = "gp2"
  }
  tags = {
    Name ="Efs-example"
    Environment = "DEV"
    OS = "Linux"
    Managed = "Terraform"
  }

  depends_on = [ aws_security_group.ec2_sg ]
}


output "ec2instance" {
  value = aws_instance.project-iac.public_ip
}

# resource "null_resource" "configure_nfs" {
# depends_on = [aws_efs_mount_target.efs-mt-engx-us-east1c]
# connection {
# type     = "ssh"
# user     = "ec2-user"
# private_key = file("testuser-ssh-key.pem")
# host     = aws_instance.project-iac.public_ip
# }
#
# provisioner "remote-exec" {
# inline = [
# "sudo yum install httpd php git -y -q ",
# "sudo systemctl start httpd",
# "sudo systemctl enable httpd",
# "sudo yum install nfs-utils -y -q ", # Amazon ami has pre installed nfs utils# Mounting Efs
# "sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${aws_efs_file_system.efs-engx.dns_name}:/  /var/www/html",# Making Mount Permanent
# "echo ${aws_efs_file_system.efs-engx.dns_name}:/ /var/www/html nfs4 defaults,_netdev 0 0  | sudo cat >> /etc/fstab " ,
# "sudo chmod go+rw /var/www/html","sudo git clone https://github.com/Apeksh742/EC2_instance_with_terraform.git /var/www/html",  ]
#  }
# }
