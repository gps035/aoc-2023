locals {
  inputFile = file("${path.module}/../input")
  input     = split("\n", local.inputFile)
  parsed    = [for line in local.input : [for half in split("|", split(":", line)[1]) : regexall("[0-9]+", half)]]
  matches   = [
    for game in local.parsed :length([for candidate in game[1] : candidate if contains(game[0], candidate)])
  ]
  cards_won_by_game = {
    for index in range(length(local.matches)) : index => range(index + 1, index + 1 + local.matches[index])
  }
  start = {
    total = length(local.matches)
    cards = flatten([for index in range(length(local.matches)): local.cards_won_by_game[index]])
  }
  iter_1 = {
    total = local.start.total + length(local.start.cards)
    cards = flatten([for card in local.start.cards: local.cards_won_by_game[card]])
  }
  iter_2 = {
    total = local.iter_1.total + length(local.iter_1.cards)
    cards = flatten([for card in local.iter_1.cards: local.cards_won_by_game[card]])
  }
  iter_3 = {
    total = local.iter_2.total + length(local.iter_2.cards)
    cards = flatten([for card in local.iter_2.cards: local.cards_won_by_game[card]])
  }
  iter_4 = {
    total = local.iter_3.total + length(local.iter_3.cards)
    cards = flatten([for card in local.iter_3.cards: local.cards_won_by_game[card]])
  }
  iter_5 = {
    total = local.iter_4.total + length(local.iter_4.cards)
    cards = flatten([for card in local.iter_4.cards: local.cards_won_by_game[card]])
  }
  iter_6 = {
    total = local.iter_5.total + length(local.iter_5.cards)
    cards = flatten([for card in local.iter_5.cards: local.cards_won_by_game[card]])
  }
  iter_7 = {
    total = local.iter_6.total + length(local.iter_6.cards)
    cards = flatten([for card in local.iter_6.cards: local.cards_won_by_game[card]])
  }
  iter_8 = {
    total = local.iter_7.total + length(local.iter_7.cards)
    cards = flatten([for card in local.iter_7.cards: local.cards_won_by_game[card]])
  }
  iter_9 = {
    total = local.iter_8.total + length(local.iter_8.cards)
    cards = flatten([for card in local.iter_8.cards: local.cards_won_by_game[card]])
  }
  iter_10 = {
    total = local.iter_9.total + length(local.iter_9.cards)
    cards = flatten([for card in local.iter_9.cards: local.cards_won_by_game[card]])
  }
  iter_11 = {
    total = local.iter_10.total + length(local.iter_10.cards)
    cards = flatten([for card in local.iter_10.cards: local.cards_won_by_game[card]])
  }
  iter_12 = {
    total = local.iter_11.total + length(local.iter_11.cards)
    cards = flatten([for card in local.iter_11.cards: local.cards_won_by_game[card]])
  }
  iter_13 = {
    total = local.iter_12.total + length(local.iter_12.cards)
    cards = flatten([for card in local.iter_12.cards: local.cards_won_by_game[card]])
  }
  iter_14 = {
    total = local.iter_13.total + length(local.iter_13.cards)
    cards = flatten([for card in local.iter_13.cards: local.cards_won_by_game[card]])
  }
  iter_15 = {
    total = local.iter_14.total + length(local.iter_14.cards)
    cards = flatten([for card in local.iter_14.cards: local.cards_won_by_game[card]])
  }
  iter_16 = {
    total = local.iter_15.total + length(local.iter_15.cards)
    cards = flatten([for card in local.iter_15.cards: local.cards_won_by_game[card]])
  }
  iter_17 = {
    total = local.iter_16.total + length(local.iter_16.cards)
    cards = flatten([for card in local.iter_16.cards: local.cards_won_by_game[card]])
  }
  iter_18 = {
    total = local.iter_17.total + length(local.iter_17.cards)
    cards = flatten([for card in local.iter_17.cards: local.cards_won_by_game[card]])
  }
  iter_19 = {
    total = local.iter_18.total + length(local.iter_18.cards)
    cards = flatten([for card in local.iter_18.cards: local.cards_won_by_game[card]])
  }
  iter_20 = {
    total = local.iter_19.total + length(local.iter_19.cards)
    cards = flatten([for card in local.iter_19.cards: local.cards_won_by_game[card]])
  }
  iter_21 = {
    total = local.iter_20.total + length(local.iter_20.cards)
    cards = flatten([for card in local.iter_20.cards: local.cards_won_by_game[card]])
  }
  iter_22 = {
    total = local.iter_21.total + length(local.iter_21.cards)
    cards = flatten([for card in local.iter_21.cards: local.cards_won_by_game[card]])
  }
  iter_23 = {
    total = local.iter_22.total + length(local.iter_22.cards)
    cards = flatten([for card in local.iter_22.cards: local.cards_won_by_game[card]])
  }
  iter_24 = {
    total = local.iter_23.total + length(local.iter_23.cards)
    cards = flatten([for card in local.iter_23.cards: local.cards_won_by_game[card]])
  }
  iter_25 = {
    total = local.iter_24.total + length(local.iter_24.cards)
    cards = flatten([for card in local.iter_24.cards: local.cards_won_by_game[card]])
  }
  iter_26 = {
    total = local.iter_25.total + length(local.iter_25.cards)
    cards = flatten([for card in local.iter_25.cards: local.cards_won_by_game[card]])
  }
  iter_27 = {
    total = local.iter_26.total + length(local.iter_26.cards)
    cards = flatten([for card in local.iter_26.cards: local.cards_won_by_game[card]])
  }
  iter_28 = {
    total = local.iter_27.total + length(local.iter_27.cards)
    cards = flatten([for card in local.iter_27.cards: local.cards_won_by_game[card]])
  }
  iter_29 = {
    total = local.iter_28.total + length(local.iter_28.cards)
    cards = flatten([for card in local.iter_28.cards: local.cards_won_by_game[card]])
  }
  iter_30 = {
    total = local.iter_29.total + length(local.iter_29.cards)
    cards = flatten([for card in local.iter_29.cards: local.cards_won_by_game[card]])
  }
  final = {
    total = local.iter_30.total + length(local.iter_30.cards)
    cards = flatten([for card in local.iter_30.cards: local.cards_won_by_game[card]])
  }
}

output "result" {
  value = length(local.final.cards) == 0 ? local.final.total : "More iterations needed: ${length(local.final.cards)} cards remaining"
}
