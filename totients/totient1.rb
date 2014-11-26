require 'prime'

$totients = {1 => 1, 2 => 1}
$factors = {1 => [1, 1], 2 => [2, 1]}

def totient1 number
  return $totients[number] if $totients[number]

  $totients[number] = case
                    when Prime.prime?(number)
                      t = number - 1
                    when number.even?
                      m = number / 2
                      if m.even?
                        t = totient1(m)  * 2
                      else
                        t = totient1(m)
                      end
                    else
                      m, n = simple_factors(number)
                      d = m.gcd(n)
                      (totient1(m) * totient1(n) * totient1(d/d))
                    end
end

def simple_factors number
  $factors[number] ||= if Prime.prime?(number)
                       [number, 1]
                     else
                       root = Math.sqrt(number).floor
                       root.downto(1) do |x|
      next unless number % x == 0
      break [x, number / x]
    end
  end
end
