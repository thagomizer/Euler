5.times do |n|
  puts "Outer #{n}"
  5.times do |x|
    puts "Inner #{x}"
    if x % 2 == 1 then
      puts "BREAKING"
      break
    end
  end
end
