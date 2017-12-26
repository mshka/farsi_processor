require "farsi_normalizer/version"

class FarsiNormalizer
  ARABIC_KAF = "\u0643" #ك
  FARSI_KEHEH = "\u06a9" #ک

  ARABIC_YEH = "\u064a" #ي
  ARABIC_ALEF_MAKSOURA = "\u0649" #ى
  FARSI_YEH = "\u06cc" #ی

  ALEF_MADDA = "\u0622" #آ
  ALEF_WITH_HAMZA_BELOW = "\u0625" #إ
  ALEF_WITH_HAMZA_ABOVE = "\u0623" #أ
  ALEF = "\u0627" #ا

  TATWIL = "\u0640" #ـ

  FATHATAN = "\u064b"
  DAMMATAN = "\u064c"
  KASRATAN = "\u064d"
  FATHA = "\u064e"
  DAMMA = "\u064f"
  KASRA = "\u0650"
  SHADDA = "\u0651"
  SUKUN = "\u0652"

  CHARACTERS_MAPPINGS = {
    ARABIC_KAF => FARSI_KEHEH,
    ARABIC_YEH => FARSI_YEH,
    ARABIC_ALEF_MAKSOURA => FARSI_YEH,
    ALEF_MADDA => ALEF,
    ALEF_WITH_HAMZA_BELOW => ALEF,
    ALEF_WITH_HAMZA_ABOVE => ALEF,
    TATWIL => ""
  }

  DIACRITICS = [
    FATHATAN,
    DAMMATAN,
    KASRATAN,
    FATHA,
    DAMMA,
    KASRA,
    SHADDA,
    SUKUN
  ]

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
    map_charachters
    remove_diacritics
    word
  end

  private

    def filter_rules(group)
      if excepts.any?
        group.reject { |k, v| excepts.include?(k) }
      elsif onlys.any?
        group.select { |k, v| onlys.include?(k) }
      else
        group
      end
    end

    def map_charachters
      rules = filter_rules(CHARACTERS_MAPPINGS)
      return if rules.empty?

      word.gsub!(/[#{rules.keys.join}]/, rules)
    end

    def remove_diacritics
      rules = filter_rules(DIACRITICS)
      return if rules.empty?

      word.gsub!(/[#{rules.join}]/, "")
    end
end
