require 'pry'
class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender,receiver,status="pending",amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status = status
  end

  def valid?
    sender.valid? && receiver.valid?
    # binding.pry
  end

  def execute_transaction
      if sender.balance > self.amount && self.status == "pending" &&self.valid?
        self.status = "complete"
        sender.balance-=amount
        receiver.balance+=amount
        # binding.pry
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
  end

  def reverse_transfer
    if self.status == "complete" && self.valid? 
      self.status = "reversed"
      sender.balance+=amount
      receiver.balance-=amount
      # binding.pry
    end
  end
end
