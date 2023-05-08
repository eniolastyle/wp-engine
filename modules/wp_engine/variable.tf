variable "db" {
  type        = string
  default     = "database"
  description = "Database name"
}

variable "user" {
  type        = string
  default     = "test-user"
  description = "Username required"
}

variable "pass" {
  type        = string
  default     = "1234"
  description = "Password required"
}

variable "theme" {
  type = string
  default = "https://downloads.wordpress.org/theme/astra.3.7.2.zip"
  description = "Provide your custome theme"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Your preffered region"
}

variable "ami" {
  type        = string
  description = "Database name"
}

variable "key_name" {
  type        = string
  description = "Key pair to SSH"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Instance type"
}
