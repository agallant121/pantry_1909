class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
    @stock_check = 0
  end

  def stock_check(ingredient)
    @stock_check
  end

  def restock(ingredient, amount)
    @stock_check += amount
    @stock[ingredient] = amount
  end

  def enough_ingredients_for?(recipe)
    x = nil
    @stock.find_all do |ingredient|
      # require "pry"; binding.pry
    if @stock.keys.length < recipe.amount_required(ingredient[0])
      x = false
    else
      x = true
    end
    end
    x
  end
end
#.keys.length
