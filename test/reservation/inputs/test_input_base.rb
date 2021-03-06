# -*- encoding : utf-8 -*-

require 'helper'

module Reservation
  module Inputs
    class TestInputBase < Test::Unit::TestCase

      def setup
        customer_type = 'regular'
        check_days = ['2013-05-26', '2013-05-27']
        @line = 'Rewards: 20Mar2009(fri), 21Mar2009(sat), 22Mar2009(sun)'
        @input = InputBase.new(customer_type, check_days)
      end

      def test_default_type
        assert_equal 'regular', @input.default_type(nil)
        assert_equal 'regular', @input.default_type("regular")
        assert_equal 'rewards', @input.default_type("rewards")
      end

      def test_current_type
        assert_equal 'regular', @input.customer_type
        assert_equal 'regular', @input.current_type(0)

        assert_equal 'rewards', @input.current_type(1)
      end

      def test_parse_line
        customer_type, check_days = @input.parse_line(@line)
        assert_equal 'rewards', customer_type
        assert_equal 3, check_days.size
      end

    end
  end
end