# frozen_string_literal: true

require_relative "test_helper"

module Onigmo
  class CompileTest < Test::Unit::TestCase
    def test_success
      refute_nil Onigmo.compile("abc")
    end

    def test_exactn_reads_string_payload
      assert_equal [[:exactn, "abcdef"], [:end]], Onigmo.compile("abcdef")
    end

    def test_exactn_ic_reads_string_payload
      assert_equal [[:exactn_ic, "abcdefgh"], [:end]], Onigmo.compile("(?i:abcdefgh)")
    end

    def test_exactmbn_reads_all_string_payload
      assert_equal [[:exactmbn, 4, 2, "😀😀"], [:end]], Onigmo.compile("😀😀")
    end

    def test_failure
      assert_raise(ArgumentError) { Onigmo.compile("(?<>)") }
    end
  end
end
