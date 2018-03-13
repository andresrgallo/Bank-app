class AtmModel
  attr_accessor :balance
  def initialize(balance: 0)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end
  def withdraw(amount)
    @balance -= amount
  end
end


class AtmView
  def welcome
    puts 'Welcome'
    puts 'What would you like to do'
  end

  def menu
    choice = nil
    while choice != 'B' && choice != 'D' && choice != 'W' && choice != 'X'
      puts 'type B for Balance, D for Deposit, W for Withdrawal or X for Exit'
      choice = gets.chomp.upcase
    end
    choice
  end

  def deposit
    puts 'How much to deposit?'
    deposit = gets.chomp
    deposit.to_i
  end
  def withdraw
    puts 'How much to withdraw?'
    withdraw = gets.chomp
    withdraw.to_i
  end
  def print_balance(balance)
    puts "Your current balance is #{balance}"
  end

  def exit
    puts 'Hasta la vista Baby'
  end
end
class AtmController
  def initialize
    @atmModel = AtmModel.new
    @atmView = AtmView.new
  end

  def run
    @atmView.welcome
    choice = @atmView.menu
    while choice != 'X'
      if choice == 'B'
        acc_balance = @atmModel.balance
        @atmView.print_balance(acc_balance)
      end
      if choice == 'D'
        acc_deposit = @atmView.deposit
        @atmModel.deposit(acc_deposit)
        puts "Current balance = #{@atmModel.balance}"
      end
      if choice == 'W'
        acc_withdraw = @atmView.withdraw
        @atmModel.withdraw(acc_withdraw)
        puts "Current balance = #{@atmModel.balance}"
      end
      choice = @atmView.menu
    end
    @atmView.exit
  end
end

atmController = AtmController.new
atmController.run
