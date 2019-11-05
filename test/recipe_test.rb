require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test

  def setup
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_it_exisits
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_it_has_a_name
    assert_equal "Mac and Cheese", @mac_and_cheese.name
  end

  def test_it_starts_with_no_required_ingredients
    assert_equal ({}), @mac_and_cheese.ingredients_required
  end

  def test_it_can_add_ingredients
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese.add_ingredient(cheese, 2)
    @mac_and_cheese.add_ingredient(mac, 8)

    expected = {
      cheese => 2,
      mac => 8
    }

    assert_equal expected, @mac_and_cheese.ingredients_required
  end

  def test_ingredient_amount_required
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese.add_ingredient(cheese, 2)
    @mac_and_cheese.add_ingredient(mac, 8)


    @mac_and_cheese.amount_required(cheese)
    @mac_and_cheese.amount_required(mac)

    assert_equal [cheese, mac], @mac_and_cheese.ingredients
  end

  def test_it_has_total_calories
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese.add_ingredient(cheese, 2)
    @mac_and_cheese.add_ingredient(mac, 8)


    @mac_and_cheese.amount_required(cheese)
    @mac_and_cheese.amount_required(mac)
    assert_equal 440, @mac_and_cheese.total_calories
  end
end
