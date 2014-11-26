## LOOSELY BASED ON THIS 
## PYTHON
# def find_factor(n) :
#     for i in xrange(2, int(n**0.5 + 1)) :
#         if n % i == 0 :
#             return i
#     return n

# def find_factors(n) :
#     factors = []
#     while n != 1 :
#         fac = find_factor(n)
#         if fac not in factors :
#             factors.append(fac)
#         n /= fac
#     return factors

# def totient(n) :
#     for factor in find_factors(n) :
#         n = n * (factor - 1) / factor

#     return n

def totient4 n
  Prime.prime_division(n).each do |factor, _|
    n = n * (factor - 1) / factor
  end
  return n
end
