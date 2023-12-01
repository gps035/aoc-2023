locals {
  inputFile = file("${path.module}/../input")
  step1     = replace(local.inputFile, "one", "o1e")
  step2     = replace(local.step1, "two", "t2o")
  step3     = replace(local.step2, "three", "t3e")
  step4     = replace(local.step3, "four", "f4r")
  step5     = replace(local.step4, "five", "f5e")
  step6     = replace(local.step5, "six", "s6x")
  step7     = replace(local.step6, "seven", "s7n")
  step8     = replace(local.step7, "eight", "e8t")
  step9     = replace(local.step8, "nine", "n9e")
  input     = split("\n", local.step9)
  digits    = [for line in local.input : regexall("[0-9]", line)]
  pairs     = [for line in local.digits : "${element(line, 0)}${element(line, length(line)-1)}"]
}

output "result" {
  value = sum(local.pairs)
}
