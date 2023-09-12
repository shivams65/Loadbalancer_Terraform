variable "location" {
  type    = string
  default = "east us"
}

variable "rg_name" {
  type    = string
  default = "Shivam-resourcegroup"
}

variable "key_vault" {
  type = map(any)
}