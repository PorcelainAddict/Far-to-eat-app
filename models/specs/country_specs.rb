require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../country.rb')

class TestCountry < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Spain",
       "travelled" => false}
    @country = Country.new(options)
  end


  def test_name()
    result = @country.name
    assert_equal("Spain", result )
  end

  def test_id()
    result = @country.id
    assert_equal(1, result)
  end

  def test_travelled
    result = @country.travelled
    assert_equal(false, result)
  end


end
