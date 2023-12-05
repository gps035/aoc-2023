locals {
  inputFile = file("${path.module}/../input")
  input     = split("\n", local.inputFile)
  parsed    = [for line in local.input : [for half in split("|", split(":", line)[1]) : regexall("[0-9]+", half)]]
  matches   = [
    for game in local.parsed :length([for candidate in game[1] : candidate if contains(game[0], candidate)])
  ]
  scores = [for count in local.matches : count == 0 ? 0 : pow(2, count - 1)]
}

output "result" {
  value = sum(local.scores)
}
