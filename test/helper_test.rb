require_relative 'test_helper'

class HelperTest < MiniTest::Unit::TestCase
  include ActionMailer::EmailBoilerplate::Helper

  def test_normal_link_options
    assert normal_link_options.has_key? :style
  end

  def test_normal_image_options
    assert normal_image_options.has_key? :border
  end

  def test_normal_table_cell_options
    assert normal_table_cell_options.has_key? :style
  end  

  def test_normal_table_options
    assert normal_table_options.has_key? :cellpadding
    assert normal_table_options.has_key? :cellspacing
    assert normal_table_options.has_key? :border
    assert normal_table_options.has_key? :width
  end    

  def test_normal_paragraph_options
    assert normal_paragraph_options.has_key? :style
    assert normal_paragraph_options[:style].has_key? :margin
  end   
end