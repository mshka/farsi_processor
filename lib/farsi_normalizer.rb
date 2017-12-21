require "farsi_normalizer/version"

class FarsiNormalizer
  ARABIC_KAF = "\u0643" #ك
  FARSI_KEHEH = "\u06a9" #ک
  ARABIC_YEH = "\u064a" #ي
  ARABIC_ALEF_MAKSOURA = "\u0649" #ى
  FARSI_YEH = "\u06cc" #ی

  CHARACTERS_MAPPINGS = {
    ARABIC_KAF => FARSI_KEHEH,
    ARABIC_YEH => FARSI_YEH,
    ARABIC_ALEF_MAKSOURA => FARSI_YEH,
  }

  def self.normalize(word, options = {})
    new(word, options).normalize
  end

  attr_reader :word, :excepts, :onlys

  def initialize(word, options = {})
    @word = word.dup

    @onlys = []
    @excepts = []
    if options[:only]
      @onlys = options[:only]
    elsif options[:except]
      @excepts = options[:except]
    end
  end

  def normalize
    normalize_charachters
    word
  end

  private

    def rules
      if excepts.any?
        CHARACTERS_MAPPINGS.reject { |k, v| excepts.include?(k) }
      elsif onlys.any?
        CHARACTERS_MAPPINGS.select { |k, v| onlys.include?(k) }
      else
        CHARACTERS_MAPPINGS
      end
    end

    def normalize_charachters
      word.gsub!(/[#{rules.keys.join}]/, CHARACTERS_MAPPINGS)
    end
end
