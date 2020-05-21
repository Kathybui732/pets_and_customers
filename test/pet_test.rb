require "minitest/autorun"
require "minitest/pride"
require "./lib/pet"

class PetTest < Minitest::Test

  def setup
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
  end

  def test_it_exists
    assert_instance_of Pet, @samson
  end

  def test_it_has_attributes
    assert_equal "Samson", @samson.name
    assert_equal :dog, @samson.type
    assert_equal 3, @samson.age
  end

  def test_it_starts_not_fed?
    assert_equal false, @samson.fed?
  end

  def test_it_is_no_longer_hungry_after_fed
    @samson.feed
    assert_equal true, @samson.fed?
  end
end
