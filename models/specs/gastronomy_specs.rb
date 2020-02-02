require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../gastronomy.rb')

class TestGastronomy < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Bitacora",
      "address" => "Carrer de Balboa, 1, 08003 Barcelona, Spain",
    "food" => "Seafood", "alcohol" => "Beers & Wine", "country_id" => countries.id}
    @gastronomy = Gastronomy.new(options)
  end

  def test_id
    result = @gastronomy.id
    assert_equal(1, result)
  end

  def test_name
    result = @gastronomy.name
    assert_equal("Bitacora", result)
  end

  def test_address
    result = @gastronomy.address
    assert_equal("Carrer de Balboa, 1, 08003 Barcelona, Spain", result)
  end

  def test_food
    result = @gastronomy.food
    assert_equal("Seafood", result)
  end

  def test_alcohol
    result = @gastronomy.alcohol
    assert_equal("Beers & Wine", result)
  end


end
