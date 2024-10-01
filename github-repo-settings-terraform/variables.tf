# variable "repos" {
#   default = [
#     "roboshop-cart",
#     "roboshop-catalogue",
#     "roboshop-user",
#     "roboshop-shipping",
#     "roboshop-payment",
#     "roboshop-frontend"
#   ]
# }

variable "repos" {
  default = {
    "roboshop-cart" = {}
    "roboshop-catalogue" = {}
  }
}

variable "env" {
  default = {
    "DEV" = {}
    "QA" = {}
    "UAT" = {}
    "PROD" = {}
  }
}