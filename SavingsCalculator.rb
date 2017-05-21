puts "*********************************************************"
puts "The name of your expenses file should be data.txt\n"
puts "The name of your income file should be salary.txt\n"
puts "*********************************************************"

total_expenses = 0
total_income = 0

File.open("data.txt", 'r') do |f|
    f.each_line do |line|
        amount = (line.split(' ')[1]).to_f
        frequency = (line.split(' ')[2]).to_f
        total_expenses = total_expenses + (amount * frequency)
    end
end

puts "Looks like your total annual expenses are: "
puts total_expenses.round(2)

File.open("salary.txt", 'r') do |f|
    f.each_line do |line|
        pay = (line.split(' ')[0]).to_f
        frequency = (line.split(' ')[1]).to_f
        total_income = total_income + (pay * frequency)
    end
end

puts "\nAnd it definitely looks like your total annual net income is: "
puts total_income.round(2)

puts "\nSo your annual savings should definitely be: "
total_savings = total_income - total_expenses
puts total_savings.round(2)


puts "\nTo calculate how much money you would have to save from each paycheck, select an option: \n1) You are paid monthly\n2) You are paid Bi-weekly\n3) You are paid weekly\n"
response = gets.to_i

case response
when 1
    puts "Your monthly savings should be: "
    puts (total_savings/12).round(2)
when 2
    puts "Your Bi-weekly savings should be: "
    puts (total_savings/24).round(2)
when 3
    puts "Your weekly savings should be: "
    puts (total_savings/52).round(2)
else
    puts "Wrong Option"
end


puts "\n"
