module PhoneHelper

  def phone_with_formatting(phone)
    return phone unless phone =~ /\A\d{10}\z/
    "#{phone[0,3]}-#{phone[3,3]}-#{phone[6,4]}"
  end

end