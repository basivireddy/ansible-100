#Output the IP Address of the Container
output "App1 IP Address" {
  value = "${aws_instance.app1.public_ip}"
 
}

output "App2 IP Address" {
  value = "${aws_instance.app2.public_ip}"
 
}

