RSpec::Matchers.define :ensure_booleanness_of do |attribute|
  match do |instance|
    @failures = []
    [true, false].each do |boolean|
      instance[attribute] = boolean
      instance.valid?
      if instance.errors[attribute].any?
        @failures << "was not valid for #{boolean}"
      end
    end
    instance[attribute] = nil
    instance.valid?
    unless instance.errors[attribute].empty?
      @failures << "was valid for #{nil}"
    end
    @failures.any?
  end

  failure_message_for_should do |instance|
    "expected that #{instance.class} would validate the booleanness of #{attribute}"
  end

end