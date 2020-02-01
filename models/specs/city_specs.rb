require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../city.rb')

class TestCity <MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Barcelona", "travelled" => "True"}
    @city = City.new(options)
  end


  def test_name()
    result = @city.name
    assert_equal("Barcelona", result )
  end

  def test_id()
    result = @city.id
    assert_equal(1, result)
  end

  def test_travelled()
    result = @city.travelled
    assert_equal("True", result)
  end 


end
