module "day01" { source = "./day01" }
output "day01_part1" { value = module.day01.part1 }
output "day01_part2" { value = module.day01.part2 }
