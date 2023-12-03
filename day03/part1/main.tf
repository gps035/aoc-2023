locals {
  inputFile      = file("${path.module}/../input")
  input          = split("\n", local.inputFile)
  max_row_idx    = length(local.input) - 1
  max_column_idx = length(local.input[0]) - 1
  just_numbers   = [
    for row_index in range(length(local.input)) : split(" ", replace(local.input[row_index], "/[^0-9]/", " "))
  ]
  numbers_with_indexes = [
    for row_index in range(length(local.just_numbers)) : [
      for idx in range(length(local.just_numbers[row_index])) : {
        number       = local.just_numbers[row_index][idx]
        column_index = length(join(" ", slice(local.just_numbers[row_index], 0, idx))) + 1
        row_index    = row_index
      } if local.just_numbers[row_index][idx] != ""
    ]
  ]
  numbers_with_adjacent_substrings = [
    for obj in flatten(local.numbers_with_indexes) : {
      number = obj.number
      x = obj.row_index == 0 ? "" : substr(
        local.input[obj.row_index - 1],
        obj.column_index == 0 ? 0 : obj.column_index - 1,
        length(obj.number) + 2
      )
      y = substr(
        local.input[obj.row_index],
        obj.column_index == 0 ? 0 : obj.column_index - 1,
        length(obj.number) + 2
      )
      z = obj.row_index == local.max_row_idx ? "" : substr(
        local.input[obj.row_index + 1],
        obj.column_index == 0 ? 0 : obj.column_index - 1,
        length(obj.number) + 2
      )
    }
  ]
  part_numbers = [
    for obj in local.numbers_with_adjacent_substrings : obj.number if length(
      regexall(
        "[^.0-9]",
        join("", [obj.x, obj.y, obj.z]),
      )
    ) > 0
  ]
}

output "result" {
  value = sum(local.part_numbers)
}
