locals {
  inputFile      = file("${path.module}/../input")
  input          = split("\n", local.inputFile)
  max_row_idx    = length(local.input) - 1
  max_column_idx = length(local.input[0]) - 1
  just_numbers   = [
    for row_index in range(length(local.input)) : split(" ", replace(local.input[row_index], "/[^0-9]/", " "))
  ]
  numbers_with_indexes = flatten([
    for row_index in range(length(local.just_numbers)) : [
      for idx in range(length(local.just_numbers[row_index])) : {
        number             = local.just_numbers[row_index][idx]
        column_start_index = length(join(" ", slice(local.just_numbers[row_index], 0, idx))) + 1
        column_end_index   = length(join(" ", slice(local.just_numbers[row_index], 0, idx))) + length(local.just_numbers[row_index][idx])
        row_index          = row_index
      } if local.just_numbers[row_index][idx] != ""
    ]
  ])
  characters = [
    for line in local.input : split("", line)
  ]
  potential_gear_indexes_by_line = [
    for row_index in range(length(local.characters)) : [
      for idx in range(length(local.characters[row_index])) : {
        y = idx
        x = row_index
      } if local.characters[row_index][idx] == "*"
    ]
  ]
  adjacent_numbers = [
    for position in flatten(local.potential_gear_indexes_by_line) : [
      for obj in local.numbers_with_indexes : obj.number
      if obj.row_index >= position.x - 1 &&
      obj.row_index <= position.x + 1 &&
      obj.column_start_index <= position.y + 1 &&
      obj.column_end_index >= position.y - 1
    ]
  ]
  gears = [
    for potential_gear in local.adjacent_numbers : potential_gear if length(potential_gear) == 2
  ]
  gear_ratios = [
    for gear in local.gears : gear[0] * gear[1]
  ]
}

output "result" {
  value = sum(local.gear_ratios)
}
