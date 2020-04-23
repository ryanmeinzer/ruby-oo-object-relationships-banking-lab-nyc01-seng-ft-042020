#This is the pair program of Ryan Meinzer & Caroline Glass

require 'pry'

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, status)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.balance < @amount || self.status == "complete" || !self.valid?
      sender.close_account
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
    sender.balance += @amount
    receiver.balance -= @amount
    self.status = "reversed"
    end
  end

end
