locals {
  inputFile = file("${path.module}/../input")
  input     = split("\n", local.inputFile)

  red_counts = [
    for line in local.input :[for count in regexall("[0-9]+ red", line) : tonumber(regex("[0-9]+", count))]
  ]
  max_reds = [for counts in local.red_counts : max(counts...)]

  blue_counts = [
    for line in local.input :[for count in regexall("[0-9]+ blue", line) : tonumber(regex("[0-9]+", count))]
  ]
  max_blues = [for counts in local.blue_counts : max(counts...)]

  green_counts = [
    for line in local.input :[for count in regexall("[0-9]+ green", line) : tonumber(regex("[0-9]+", count))]
  ]
  max_greens = [for counts in local.green_counts : max(counts...)]
  powers     = [for i in range(length(local.input)) : local.max_reds[i] * local.max_blues[i] * local.max_greens[i]]
}

output "result" {
  value = sum(local.powers)
}
