require_relative "test_helper"
require "matrix"
#require_relative '../lib/battleship/field'
require 'test/unit'

class BattleshipTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Battleship::VERSION
  end

  def test_add_right_ship_case
    f = Field.new
    m = Matrix[[1,1,0,0,0,0,0,0,0,0],
       [2,1,0,0,0,0,0,0,0,0],
       [2,1,0,0,0,0,0,0,0,0],
       [2,1,0,0,0,0,0,0,0,0],
       [1,1,0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,0,0]]
       f.add_ship('a2:a4')
    assert_equal(m, f.field_getter)
  end

  def test_invalid_ship
    f = Field.new
    f.add_ship('a1:a4')
    assert_raises(InvalidShip) do
     f.add_ship('a2:a6')
    end

    assert_raises(InvalidShip) do
     f.add_ship('a2:b3')
    end

    assert_raises(InvalidShip) do
     f.add_ship('a2')
    end

    assert_raises(InvalidShip) do
     f.add_ship('c1:c4')
    end

    assert_raises(InvalidShip) do
     f.add_ship('c0:c1')
    end
  end

  def test_right_clean
    f = Field.new
    f.add_ship('a2:a4')
    m = Matrix::zero(10)
    f.clean_field
    assert_equal(m, f.field_getter)
  end

    def test_length
        s = Matrix[[0,0,0,0,0,0,0],
             [0,1,-1,1,0,0,0],
             [0,1,-2,1,0,0,0],
             [0,0,2,1,0,0,0],
             [0,1,-2,1,0,0,0],
             [0,1,2,1,0,0,0],
             [0,1,0,1,0,0,0]]

        assert_equal(2, ship_length(s, 4, 2))

        s = Matrix[[0,0,0,0,0,0,0],
           [0,1,-1,1,1,-1,0],
           [0,1,2,-2,-2,-1,0],
           [0,0,1,1,0,0,0],
           [0,1,1,1,0,0,0],
           [0,-1,0,1,0,0,0],
           [0,1,0,-1,0,0,0]]
        assert_equal(1, ship_length(s, 2, 4))

        s = Matrix[[2,1,0,0,0,0,0],
           [0,1,-1,1,0,0,0],
           [0,1,-2,1,0,0,0],
           [0,0,1,1,0,0,0],
           [0,1,1,1,0,0,0],
           [0,-1,0,1,0,0,0],
           [0,1,0,-1,0,0,0]]
        assert_equal(0, ship_length(s, 2, 2))
    end
end
