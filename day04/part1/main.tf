locals {
  inputFile           = file("${path.module}/../input")
  input               = split("\n", local.inputFile)
  without_game_number = [for line in local.input : split(":", line)[1]]
  games               = [for game in local.without_game_number : split("|", game)]
  parsed              = [for game in local.games : [for half in game: toset(regexall("[0-9]+", half))]]
  winning_numbers     = [for game in local.parsed : [for candidate in game[1]: candidate if contains(game[0], candidate)]]
  winning_counts      = [for numbers in local.winning_numbers : length(numbers)]
  scores              = [for count in local.winning_counts : count == 0 ? 0 : pow(2, count - 1)]
}

output "result" {
  value = sum(local.scores)
}
