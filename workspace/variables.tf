variable "instance_type"{
    type = map
    default = {
    dev = "t3.micro"
    prod = "t2.small"
    }
}