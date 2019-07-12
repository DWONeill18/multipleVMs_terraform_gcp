resource "google_compute_instance" "default2" {
	name = "${var.name2}"
	machine_type = "${var.machine_type}"
	zone = "${var.zone}"
	tags = ["${var.name2}"]
	boot_disk {
		initialize_params {
			image = "${var.image}"
		}
	}
	network_interface {
		network = "${var.network}"
		access_config {
		}
	}
	metadata = {
    	sshKeys = "${var.ssh_user2}:${file("${var.public_key}")}"
  	}
	connection {
		type = "ssh"
		user = "${var.ssh_user2}"
	host = "${google_compute_instance.default2.network_interface.0.access_config.0.nat_ip}" 
		private_key = "${file("${var.private_key}")}"
	}
	provisioner "remote-exec" {
		inline = [
			"${var.update_packages[var.package_manager]}",
			"${var.install_packages[var.package_manager]} ${join(" ", var.packages)}"
		]
	}
	provisioner "remote-exec" {
		scripts = "${var.scripts}"
	}
}
