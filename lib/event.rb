class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    array = []
    @food_trucks.each do |truck|
      truck.inventory.each do |key, value|
        if key == item
          array << truck
        end
      end
    end
    array
  end

  def total_inventory
    hash = {}
    @food_trucks.each do |trucks|
      trucks.inventory.each do |item, quantity|
        if hash[item].nil?
          hash[item] = {
            quantity: quantity,
            food_trucks: [trucks]
          }
        else
          hash[item][:quantity] += quantity
          hash[item][:food_trucks] << trucks
        end
      end
    end
    hash
  end

  def overstocked_items
    array = []
    total_inventory.map do |item, values|
      if values[:quantity] > 50 && values[:food_trucks].count > 1
        array << item
      end
    end
    array
  end

  def sorted_item_list
    array = []
    @food_trucks.each do |trucks|
      trucks.inventory.each do |truck, quantity|
        array << truck.name
      end
    end
    array.sort.uniq
  end
end