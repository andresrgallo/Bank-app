class Account
    attr_accessor :balance
    def initialize
        balance = File.read("balance.txt")
        @balance = balance.to_i
        @history = Array.new
    end
    def balance
        puts "your current balance is $#{@balance}"
        welcome
    end
    def deposit
        puts "how much?"
        @deposit = gets.chomp.to_i
        @balance += @deposit
        File.open("balance.txt","w") do |file|
            file << @balance
        end
        @history << "Deposit of #{@deposit}"
        welcome
    end
    def withdraw
        puts "how much?"
        @withdraw = gets.chomp.to_i
        @balance -= @withdraw
        File.open("balance.txt","w") do |file|
            file << @balance
        end
        welcome
    end
    def welcome
        puts "Hi, what would you like to do, balance, deposit, withdraw, history or exit"
        option = gets.chomp
        operation(option)
    end
    def history
      p @history
    end
    def operation(option)
        case option
        when "balance"
            balance
        when "deposit"
            deposit
        when "withdraw"
            withdraw
        when "history"
            history
        when "exit"  
            exit
        else
            welcome
        end
    end
end

account = Account.new
account.welcome
