# If the numbers 1 to 5 are written out in words: one, two, three, four,
# five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out
# in words, how many letters would be used?

$words = {}
$words[0] = ''
$words[1] = 'one'
$words[2] = 'two'
$words[3] = 'three'
$words[4] = 'four'
$words[5] = 'five'
$words[6] = 'six'
$words[7] = 'seven'
$words[8] = 'eight'
$words[9] = 'nine'
$words[10] = 'ten'
$words[11] = 'eleven'
$words[12] = 'twelve'
$words[13] = 'thirteen'
$words[15] = 'fifteen'
$words[18] = 'eighteen'
$words[20] = 'twenty'
$words[30] = 'thirty'
$words[40] = 'forty'
$words[50] = 'fifty'
$words[60] = 'sixty'
$words[70] = 'seventy'
$words[80] = 'eighty'
$words[90] = 'ninety'

def words_for_num(n)
  return $words[n] if $words[n]
  return 'one thousand' if n == 1000

  # between 11 and 20
  if (n - 10) < 10 then
    return $words[n % 10] + 'teen'
  elsif (n - 100) < 0 then
    $words[n/10 * 10] + ' ' + $words[n % 10]
  elsif n % 100 == 0
    $words[n / 100] + ' hundred'
  else
    $words[n / 100] + ' hundred and ' + words_for_num(n % 100)
  end
end

$letters = {}
$words.each{|k, v| $letters[k] = v.length}

def letters_for_num(n)
  return $letters[n] if $letters[n]
  return 11 if n == 1000

  # between 11 and 20
  if (n - 10) < 10 then
    return $letters[n % 10] + 4
  elsif (n - 100) < 0 then
    $letters[n/10 * 10] + $letters[n % 10]
  elsif n % 100 == 0
    $letters[n / 100] + 7
  else
    $letters[n / 100] + 10 + letters_for_num(n % 100)
  end
end

def letters_for_num2 n
  words_for_num(n).gsub(/\W+/, '').size
end

# puts words_for_num(1)
# puts letters_for_num(1)
# puts words_for_num(10)
# puts letters_for_num(10)
# puts words_for_num(14)
# puts letters_for_num(14)
# puts words_for_num(19)
# puts letters_for_num(19)
# puts words_for_num(38)
# puts letters_for_num(38)
# puts words_for_num(82)
# puts letters_for_num(82)
puts words_for_num(596)
puts letters_for_num(596)
puts letters_for_num2(596)
# puts words_for_num(1000)
# puts letters_for_num(1000)
# puts words_for_num(400)
# puts letters_for_num(400)
# puts words_for_num(101)
# puts letters_for_num(101)
# puts words_for_num(115)
# puts letters_for_num(115)


t0 = Time.now
result = (1..1000).inject(0){|sum, i| sum += letters_for_num(i)}
p Time.now - t0

t0 = Time.now
result = (1..1000).inject(0){|sum, i| sum += letters_for_num2(i)}
p Time.now - t0

puts result

# five hundred and ninety six
# 23
# 23
# 0.010804
# 0.018519
# 21124

# real	0m0.059s
# user	0m0.023s
# sys	0m0.005s
