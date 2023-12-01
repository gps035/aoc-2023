locals {
  inputFile = file("${path.module}/../input")
  input     = split("\n", local.inputFile)
  digits    = [for line in local.input : regexall("[0-9]", line)]
  pairs     = [for line in local.digits : "${element(line, 0)}${element(line, length(line)-1)}"]
  numbers   = [for line in local.pairs : parseint(line, 10)]
}

output "result" {
  value = sum(local.pairs)
}
