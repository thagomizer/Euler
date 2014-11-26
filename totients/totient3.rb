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

def find_factor n
  (2..(n / 2 + 1)).each do |i|
    if n % i == 0
      return i
    end
  end
  return n
end

def find_factors n
  factors = []
  while n != 1
    fac = find_factor n
    unless factors.include? fac
      factors << fac
    end
    n /= fac
  end
  return factors
end

def totient3 n
  find_factors(n).each do |factor|
    n = n * (factor - 1) / factor
  end
  return n
end
