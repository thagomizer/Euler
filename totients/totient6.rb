## PseudoCode from the problem 72 write up
#
# function eulerPhi(n)
#   phi := n
#   i := 1
#   p := primes[1]
#   while (i <= primeCount and p*p <= n)
#         if n mod p = 0 then
#             phi := phi - phi div p
#             while n mod p = 0
#                 n := n div p
#             end while
#         end if
#         i := i+1
#         p := primes[i]
#     end while
#     if n > 1 then
#         phi := phi - phi div n
#     end if
#     return phi
# end function

require 'prime'
require 'pp'

def init_primes limit
  $primes = [1]
  Prime.each { |p| $primes << p; break if p > limit }
end

def totient6 n
  init_primes n unless $primes

  phi = n
  i = 1
  p = $primes[1]

  while (i <= $primes.count) and (p * p <= n) do
    if n % p == 0 then
      phi = phi - phi / p
      while n % p == 0
        n = n / p
      end
    end
    i += 1
    p = $primes[i]
  end
  if n > 1 then
    phi = phi - phi / n
  end
  phi
end

init_primes 1_000_000
