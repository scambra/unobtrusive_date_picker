require 'test/unit'
require 'rubygems'
require 'action_controller'
require 'action_view/test_case'
require 'unobtrusive_date_picker'

class UnobtrusiveDatePickerTest < ActionView::TestCase
  include UnobtrusiveDatePicker::ActionViewHelpers
  
  def test_with_record
    html = date_picker(:record, :birthday)
    assert_match /#{Regexp.quote('datePickerController.destroyDatePicker("record_birthday_3i");')}/, html
    assert_match /#{Regexp.quote('datePickerController.createDatePicker({"formElements":{"record_birthday_3i":"j","record_birthday_2i":"n","record_birthday_1i":"Y"}});')}/, html
  end
  
  def test_with_options
    html = date_picker(:record, :birthday, :date_picker_options => {:rangeLow => '20100514', :rangeHigh => '20100531', :highlightDays => [1,1,0,0,0,0,0]})
    assert_match /#{Regexp.quote('datePickerController.destroyDatePicker("record_birthday_3i");')}/, html
    assert_match /datePickerController\.createDatePicker\(\{.*"formElements":\{"record_birthday_3i":"j","record_birthday_2i":"n","record_birthday_1i":"Y"\}.*\}\);/, html
    assert_match /datePickerController\.createDatePicker\(\{.*"rangeLow":"20100514".*\}\);/, html
    assert_match /datePickerController\.createDatePicker\(\{.*"rangeHigh":"20100531".*\}\);/, html
    assert_match /datePickerController\.createDatePicker\(\{.*"highlightDays":\[1,1,0,0,0,0,0\].*\}\);/, html
  end

  def test_with_discard_type_and_prefix
    assert_match /#{Regexp.quote('datePickerController.destroyDatePicker("user_date_3i");')}/, date_picker(:record, :birthday, :discard_type => true, :prefix => 'user[date]')
  end

  def test_with_record_array_and_prefix
    @record = stub(:birthday => Date.today, :to_param => '1')
    assert_match /#{Regexp.quote('datePickerController.destroyDatePicker("record_1_birthday_3i");')}/, date_picker('record[]', :birthday)
    assert_match /#{Regexp.quote('datePickerController.createDatePicker({"formElements":{"record_user_1_birthday_3i":"j","record_user_1_birthday_2i":"n","record_user_1_birthday_1i":"Y"}});')}/, date_picker('record[]', :birthday, :prefix => 'record[user]')
  end
end
