resource "google_compute_firewall" "default2" {
	name = "${var.name2}-firewall"
	network = "${var.network}"
	target_tags = ["${var.name2}"]
	source_ranges = ["0.0.0.0/0"]

	allow {
		protocol = "icmp"
	}

	allow {
		protocol = "tcp"
		ports = "${var.allowed_ports}"	
	}	
}

