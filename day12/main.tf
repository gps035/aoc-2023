module "part1" { source = "./part1" }
output "part1" { value = module.part1.result }

module "part2" { source = "./part2" }
output "part2" { value = module.part2.result }
