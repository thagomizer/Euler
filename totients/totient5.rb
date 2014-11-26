## PHP
# $limit = 1000000;
# 	$primes = sieve_primes($limit);

# 	$result = 0;
# 	for ($d = $limit; $d >= 2; $d--) {
# 		$phi[$d] = $d;
# 	}

# 	foreach ($primes as $prime) {
# 		for ($d = $prime; $d <= $limit; $d += $prime) {
# 			$phi[$d] *= ($prime-1)/$prime;
# 		}

# 		echo $prime ."\n";
# 	}

# 	$result = array_sum($phi);

require 'prime'

def totient5 limit
  primes = []
  Prime.each do |p|
    break if p > limit
    primes << p
  end

  $phi = []

  limit.downto(1).each do |d|
    $phi[d] = d
  end

  primes.each do |prime|
    d = prime
    while d <= limit do
      $phi[d] *= (prime - 1).to_f / prime
      d += prime
    end
  end
end

