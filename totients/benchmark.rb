require_relative 'totient1'
require_relative 'totient2'
require_relative 'totient3'
require_relative 'totient4'
require_relative 'totient5'
require_relative 'totient6'

require "prime"
require "benchmark"

max = 10_000

Benchmark.bm(7) do |bm|
  bm.report("totient1") { (1..max).each { |i| totient1 i } }
  bm.report("totient2") { (1..max).each { |i| totient2 i } }
  bm.report("totient3") { (1..max).each { |i| totient3 i } }
  bm.report("totient4") { (1..max).each { |i| totient4 i } }
  bm.report("totient5") { totient5 max }
  bm.report("totient6") { (1..max).each { |i| totient6 i } }
end
