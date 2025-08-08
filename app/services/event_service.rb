class EventService

  def deposit(destination, amount)
    account = Account.find_or_create_by(id: destination)
    account.update(balance: account.balance + amount)
    { destination: { id: account.id, balance: account.balance } }
  end

  def withdraw(origin, amount)
    account = Account.find_by(id: origin)
    return nil unless account

    account.update(balance: account.balance - amount)
    { origin: { id: account.id, balance: account.balance } }
  end
end
