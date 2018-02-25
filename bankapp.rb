balance = File.read("balance.txt").to_i
history = []
bstatement = File.read("bank_statement.txt").to_s
client = File.read("client.txt").to_s
records = {}
def proc
    puts "Do you want to clean the screen?(y or n)"
    clean = gets.chomp
    clean = clean.downcase
     if clean == 'y' then
        puts `clear`
     end
end

def bankapp(balance,history,bstatement,client,records)
    puts "Welcome to the banking app"
    puts "Your balance is #{balance}"
    puts "Please type your password"
    pwd = gets
    puts "Please provide your Name and Surname"
    user = gets.chomp
    user = user.downcase
    unless client.include? user then
        client << user
    end
    
    while true
        proc
        puts "What would you like to do? (options: balance, deposit, withdraw, history, statement, quit)"
        answer = gets.chomp
        answer = answer.downcase
        case answer
            when "balance"
                balance_m(balance)
            when "quit"
            break 
            when "deposit" 
                balance = deposit(balance,history,bstatement)
            when "withdraw"
                balance = withdraw(balance,history,bstatement)
            when "history"
                history_m(history)
            when "statement"
                statement_m(bstatement,balance)
        else
            puts "Invalid selection!"
        end
        File.open("balance.txt","w") do |line|
            line.puts balance
        end
        File.open("bank_statement.txt","w") do |line|
            line.puts bstatement
        end
    end
    File.open("client.txt","w") do |line|
        line.puts client
        puts client
     client_a = client.split("\n")
     p client_a
     client_state = bstatement.split("\n")
     balance_client = "Your current balance is #{balance}"
     records[user] = [client_state, balance_client]
     puts records
    end
    
end

def balance_m(balance)
    puts "Your balance is #{balance}"
end

def deposit(balance,history,bstatement)
    puts "How much would you like to deposit?"
    amount = gets.chomp.to_i
    history << amount
    balance += amount
    bstatement << " --- TRANSACTION: Deposit of $#{amount} DATE: #{Time.now.asctime.to_s} ---\n"
    puts "Thanks for the deposit, your balance is updated to #{balance}"
    balance
end

def withdraw(balance,history,bstatement)
    puts "How much would you like to withdraw?"
    withdraw_amount = gets.chomp.to_i
    history << withdraw_amount
    bstatement << " --- TRANSACTION: Withdrawal of $#{withdraw_amount} DATE: #{Time.now.asctime.to_s} ---\n"
    if withdraw_amount > balance
        puts "Fail!! - your balance is less than the amount you want to withdraw, please try again"
     else
        balance -= withdraw_amount
        puts "Your current balance is #{balance}"
    end
    balance
    
end

def history_m(history)
    p history
end

def statement_m(bstatement,balance)
    puts bstatement
    puts "     Your current balance is #{balance}"
end

bankapp(balance,history,bstatement,client,records)



