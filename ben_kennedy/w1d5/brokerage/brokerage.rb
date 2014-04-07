require 'pry'

class Brokerage
  attr_accessor :name, :users

  def initialize(name)
    @name = name
    @users = { } 

  end

  def list_users
    if users.any?
      users.keys.join("\n")
    else 
      "You have no users!"
    end
  end

end
