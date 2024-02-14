def get_input(prompt_message)
  print prompt_message
  gets.chomp
end

def calculate_and_print_deposit_after_a_year(deposit, rate, day = nil)
  deposit = deposit.to_f
  rate = rate.to_f
  day = day.to_i if day

  raise 'Deposit must be a positive number' unless deposit.positive?
  raise 'Rate must be a positive number' unless rate.positive?
  raise 'Day must be a positive integer within range 1 to 365' if day && !(1..365).include?(day)

  rate /= 100.0
  initial_deposit = deposit

  365.times do |i|
    daily_interest = (deposit * rate) / 365.0
    deposit += daily_interest
    puts("Deposit total on day #{day}: #{deposit.round(2)}") if day == i + 1
  end

  puts "Initial deposit: #{initial_deposit.round(2)}"
  puts "Final deposit after 365 days: #{deposit.round(2)}"
rescue StandardError => e
  puts "An error occurred: #{e.message}"
end

deposit = get_input('Please enter your initial deposit: ')
rate = get_input('Please enter interest rate: ')
day = get_input('Optionally, you can enter a specific day you want to check deposit. If not, just press enter: ')

calculate_and_print_deposit_after_a_year(deposit, rate, day)
