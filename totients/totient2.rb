require 'prime'

## C
# // fact[x] = smallest prime factor of x (1 if x is prime)
# int *fact;

# // Euler's Totient function
# int phi(int x) {
#   if(x <= 1) return 1;
#   int f = fact[x];
#   if(f == 1) return x-1;
#   int p = 1, fp = 1;
#   while((x /= f) % f == 0) { p++; fp *= f; }
#   return phi(x)*(f-1)*fp;
# }

def totient2 x
  return 1 if x <= 1
  return x - 1 if Prime.prime?(x)

  f = Prime.prime_division(x)[0][0]
  p = 1
  fp = 1

  while ((x /= f) % f == 0) do
    p += 1
    fp *= f
  end

  return totient2(x) * (f - 1 ) * fp
end
