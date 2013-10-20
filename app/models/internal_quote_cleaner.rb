class InternalQuoteCleaner

  REGEX = /(,")([^"]*?((?<!,)"(?!,))+?.*?)(",(?=[",]))/

  attr_reader :string

  def initialize(string)
    @string = string
  end

  def match
    string.match(REGEX)
  end

  def matching_attribute_content
    match? ? match[2] : string
  end

  def match?
    !!match
  end

  def clean
    return string unless match
    string.gsub(REGEX, match[1] + match[2].gsub(/"/,"'") + match[3])
  end

end