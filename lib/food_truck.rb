class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.key? item
      x = @inventory.find do |name, price|
        name == item
      end[1]
    else
      0
    end
  end

  def stock(item, amount)
    x = 0
    @inventory[item] = (x += amount)
  end
end