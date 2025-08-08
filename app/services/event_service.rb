class EventService

  def deposit(destination, amount)
    account = Account.find_or_create_by(id: destination)
    account.update(balance: account.balance + amount)
    { destination: { id: account.id, balance: account.balance } }
  end

end
