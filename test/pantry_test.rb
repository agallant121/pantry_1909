require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
  end

  def test_it_exisits
    assert_instance_of Pantry, @pantry
  end

  def test_it_starts_out_empty
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    assert_equal ({}), @pantry.stock
  end

  def test_it_can_check_stock
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    assert_equal 0, @pantry.stock_check(cheese)
  end

  def test_it_can_restock
    cheese = Ingredient.new("Cheese", "C", 50)

    @pantry.restock(cheese, 5)
    @pantry.restock(cheese, 10)

    assert_equal 15, @pantry.stock_check(cheese)
  end

  def test_it_does_not_have_enough_ingredients_for_mac_and_cheese
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    @pantry.restock(cheese, 5)
    @pantry.restock(cheese, 10)
    assert_equal false, @pantry.enough_ingredients_for?(mac_and_cheese)

    @pantry.restock(mac, 7)
    assert_equal false, @pantry.enough_ingredients_for?(mac_and_cheese)

    @pantry.restock(mac, 1)
    assert_equal true, @pantry.enough_ingredients_for?(mac_and_cheese)
  end
end

# pry(main)> pantry.restock(mac, 1)
#
# pry(main)> pantry.enough_ingredients_for?(mac_and_cheese)
# # => true
# ```
