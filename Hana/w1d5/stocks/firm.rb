class Firm
  attr_accessor :name
  attr_reader :clients

  def initialize(name)
       @name = name
       @clients = {}
  end