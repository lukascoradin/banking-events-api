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

  def transfer(origin, destination, amount)
    origin_account = Account.find_by(id: origin)
    return nil unless origin_account

    destination_account = Account.find_or_create_by(id: destination)

    origin_account.update(balance: origin_account.balance - amount)
    destination_account.update(balance: destination_account.balance + amount)
    { origin: { id: origin_account.id, balance: origin_account.balance }, 
    destination: { id: destination_account.id, balance: destination_account.balance } }
  end
end
