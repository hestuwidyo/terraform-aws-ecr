variable "image_policy" {
    type = any
    default = []
}
variable "state_policy" {
    type = bool 
}
variable "tags" {
    type = map(string)
    default = {}
}
