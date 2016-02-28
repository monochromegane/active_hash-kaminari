require 'test_helper'

class ActiveHash::KaminariTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ActiveHash::Kaminari::VERSION
  end

  class Country < ActiveHash::Base
    prepend ActiveHash::Paginatable
    self.data = [
      {:id => 1, :name => "US"},
      {:id => 2, :name => "Canada"}
    ]
  end

  def test_find_with_array_returns_paginatable_array
    assert_instance_of(::Kaminari::PaginatableArray, Country.find([1, 2]))
  end

  def test_all_returns_paginatable_array
    assert_instance_of(::Kaminari::PaginatableArray, Country.all)
  end

  def test_where_returns_paginatable_array
    assert_instance_of(::Kaminari::PaginatableArray, Country.where(name: 'US'))
  end

  def test_custom_find_all_returns_paginatable_array
    # First, returns array from method missing
    assert_instance_of(::Kaminari::PaginatableArray, Country.find_all_by_name('US'))
    # Second, returns array from defined method
    assert_instance_of(::Kaminari::PaginatableArray, Country.find_all_by_name('US'))
  end

  def test_paginatable_array_has_page_scope_methods
    paginatable_array = Country.all

    %i(per padding total_pages current_page next_page prev_page first_page? last_page? out_of_range?).each do |method|
      assert_respond_to(paginatable_array, method)
    end
  end
end
