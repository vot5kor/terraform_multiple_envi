
variable "project"{
    default = "expense"
}

variable "instances"{
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable zone_id{
    default = "Z07729851ZGLEFQP62W7R"
}

variable "domain_name"{
    default = "tuktukride.online"
}

variable "ami_id"{
    default = "ami-09c813fb71547fc4f"
}

variable "common_tags"{
    type = map
    default = {
        project = "expense"
        terraform = "true"
    }
}

variable "instance_type"{
    default = "t3.micro"
}

variable "environment"{

}