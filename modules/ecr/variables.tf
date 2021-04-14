variable "ecr" {
    type = any
    default = {}
}
variable "state_ecr" {
    type = bool 
    default = true
}
variable "tags" {
    type = map(string)
    default = {}
}
