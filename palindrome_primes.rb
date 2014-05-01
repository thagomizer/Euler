#!/usr/bin/ruby -w
require 'pp'
require 'prime'

# class Fixnum
#   $primes = {0 => false, 1 => false, 2 => true}

#   def prime?
#     return $primes[self] unless $primes[self].nil?

#     root = Math.sqrt(self).to_i
#     (2..root).each do |x|
#       if self % x == 0 then
#         $primes[self] = false
#         return false
#       end
#     end
#     $primes[self] = true
#     true
#   end
# end

# primes1 = []
# 1000.upto(9999) do |x|
#   rev_x = "#{x}".reverse
#   next if rev_x.to_i.even?

#   0.upto(9) do |y|
#     num = "#{x}#{y}#{rev_x}".to_i

#     if num.prime?
#       primes1 << num
#     end
#   end
# end

# primes2 = []
# x = 1000
# while x < 10_000 do
#   rev_x = "#{x}".reverse
#   if rev_x.to_i.even?
#     x += 1000
#     next
#   end

#   0.upto(9) do |y|
#     num = "#{x}#{y}#{rev_x}".to_i

#     primes2 << num if num.prime?
#   end

#   x += 1
# end

primes3 = []
(1..9).each do |a|
  next if a.even?
  (0..9).each do |b|
    (0..9).each do |c|
      (0..9).each do |d|
        (0..9).each do |e|

          num = a * 100_000_000 +
                b *  10_000_000 +
                c *   1_000_000 +
                d *     100_000 +
                e *      10_000 +
                d *       1_000 +
                c *         100 +
                b *          10 +
                a *           1

          primes3 << num if num.prime?

        end
      end
    end
  end
end


#pp primes1
pp primes1.count
#pp primes2.count
pp primes3.count

pp primes3 - primes1
