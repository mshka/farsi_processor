 module Normalizer
  ARABIC_KAF = "\u0643".freeze # ك
  FARSI_KEHEH = "\u06a9".freeze # ک

  ARABIC_YEH = "\u064a".freeze # ي
  ARABIC_ALEF_MAKSOURA = "\u0649".freeze # ى
  FARSI_YEH = "\u06cc".freeze # ی

  ALEF_MADDA = "\u0622".freeze # آ
  ALEF_WITH_HAMZA_BELOW = "\u0625".freeze # إ
  ALEF_WITH_HAMZA_ABOVE = "\u0623".freeze # أ
  ALEF = "\u0627".freeze # ا

  TATWIL = "\u0640".freeze # ـ

  FATHATAN = "\u064b".freeze
  DAMMATAN = "\u064c".freeze
  KASRATAN = "\u064d".freeze
  FATHA = "\u064e".freeze
  DAMMA = "\u064f".freeze
  KASRA = "\u0650".freeze
  SHADDA = "\u0651".freeze
  SUKUN = "\u0652".freeze

  CHARACTERS_MAPPINGS = {
    ARABIC_KAF => FARSI_KEHEH,
    ARABIC_YEH => FARSI_YEH,
    ARABIC_ALEF_MAKSOURA => FARSI_YEH,
    ALEF_MADDA => ALEF,
    ALEF_WITH_HAMZA_BELOW => ALEF,
    ALEF_WITH_HAMZA_ABOVE => ALEF,
    TATWIL => ''
  }.freeze

  DIACRITICS = [
    FATHATAN,
    DAMMATAN,
    KASRATAN,
    FATHA,
    DAMMA,
    KASRA,
    SHADDA,
    SUKUN
  ].freeze

  def normalize
    map_charachters
    remove_diacritics
    word
  end

  private

  def map_charachters
    rules = filter_rules(CHARACTERS_MAPPINGS)
    return if rules.empty?

    @word = word.gsub(/[#{rules.keys.join}]/, rules)
  end

  def remove_diacritics
    rules = filter_rules(DIACRITICS)
    return if rules.empty?

    @word = word.gsub(/[#{rules.join}]/, '')
  end
end
