def square_sum n
  sum = 0
  while n > 0
    least_sig = n % 10
    sum += least_sig**2
    n = n / 10
  end
  return sum
end

2.upto(500_000) do |x|
  square_sum(x)
end
