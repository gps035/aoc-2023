locals {
  max_red            = 12
  max_green          = 13
  max_blue           = 14
  inputFile          = file("${path.module}/../input")
  input              = split("\n", local.inputFile)
  high_reds_filtered = [
    for line in local.input : line
    if alltrue([for red_count in regexall("[0-9]+ red", line) : regex("[0-9]+", red_count) <= local.max_red])
  ]
  high_greens_filtered = [
    for line in local.high_reds_filtered : line
    if alltrue([for green_count in regexall("[0-9]+ green", line) : regex("[0-9]+", green_count) <= local.max_green])
  ]
  high_blues_filtered = [
    for line in local.high_greens_filtered : line
    if alltrue([for blue_count in regexall("[0-9]+ blue", line) : regex("[0-9]+", blue_count) <= local.max_blue])
  ]
  game_numbers = [
    for line in local.high_blues_filtered : regex("[0-9]+", line)
  ]
}

output "result" {
  value = sum(local.game_numbers)
}
