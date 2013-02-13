# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
(1..1000).to_a.inject{|m, y| m += y**y; m = m % 10_000_000_000}
