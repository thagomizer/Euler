# By replacing the 1st digit of *3, it turns out that six of the nine possible
# values: 13, 23, 43, 53, 73, and 83, are all prime.

# By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit
# number is the first example having seven primes among the ten generated
# numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and
# 56993. Consequently 56003, being the first member of this family, is the
# smallest prime with this property.

# Find the smallest prime which, by replacing part of the number (not
# necessarily adjacent digits) with the same digit, is part of an eight prime
# value family.

require 'pp'

class Fixnum
  $primes = {0 => false, 1 => false, 2 => true}

  def prime?
    return $primes[self] unless $primes[self].nil?

    root = Math.sqrt(self).to_i
    (2..root).each do |x|
      if self % x == 0 then
        $primes[self] = false
        return false
      end
    end
    $primes[self] = true
    true
  end

  def uniq_digits
    self.to_s.split(//).uniq
  end
end

def smallest_prime_with_pattern(pattern)
  ("0".."9").each do |x|
    if pattern.gsub("*", x).to_i.prime?
      return pattern.gsub("*", x).to_i
    end
  end
end

max = [0, 0]

$checked = Hash.new

(10..1_000_000).each do |num|
  next if $checked[num]
  next if num.even?
  next unless num.prime?

  num_str = num.to_s
  digits = num.uniq_digits
  test_strs = digits.map{|x| num_str.gsub(x, "*")}
  test_strs.each do |ts|
    count = 0
    ("0".."9").each do |x|
      next if ts[0,1] == "*" and x == "0"
      possible_prime = ts.gsub("*", x).to_i
      if possible_prime.prime? then
        count += 1
      end
      $checked[possible_prime] = true
    end
    if count > 7 then
      puts count
      puts ts
      puts smallest_prime_with_pattern(ts)
      exit
    end
  end
end

# 8
# *2*3*3
# 121313

# Real	0m39.463s
# user	0m39.372s
# sys	0m0.054s
