require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'

class IngredientTest < Minitest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "oz", 50)
  end

  def test_it_exisits
    assert_instance_of Ingredient, @cheese
  end

  def test_it_has_a_name
    assert_equal "Cheese", @cheese.name
  end

  def test_it_has_a_unit
    assert_equal "oz", @cheese.unit
  end

  def test_it_has_an_amount_of_calories_per_unit
    assert_equal 50, @cheese.calories
  end
end
