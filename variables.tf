variable "ecr" {
    type = any
    default = {}
}
variable "image_policy" {
    type = any
    default = []
}
variable "tags" {
    type = map(string)
    default = {}
}
variable "state_ecr" {
    type = bool 
    default = true
}
variable "state_policy" {
    type = bool 
    default = false
}