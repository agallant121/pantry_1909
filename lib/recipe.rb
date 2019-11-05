class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(name, amount)
    @ingredients_required[name] = amount
  end

  def amount_required(name)
    @ingredients_required[name]
  end

  def ingredients
    @ingredients_required.keys.to_a.flatten
  end

  def total_calories
    total_calories = 0
    total = @ingredients_required.map do |ingredient|
      # require "pry"; binding.pry
    total_calories += (ingredient[0].calories * amount_required(ingredient[0]))
    end
    total_calories
  end
end
