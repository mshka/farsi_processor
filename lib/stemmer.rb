module Stemmer
  ALEF = "\u0627".freeze # ا
  YEH = "\u06cc".freeze # ی
  HEH = "\u0647".freeze # ه
  TET = "\u062a".freeze # ت
  REH = "\u0631".freeze # ر
  NOON = "\u0646".freeze # ن
  GAF = "\u06af".freeze # گ
  MEEM = "\u0645".freeze # م

  PLURAL_FORMS = [
    ALEF + NOON,
    ALEF + TET,
    HEH + ALEF
  ].freeze

  SUFFIXES = [
    TET + REH + YEH + NOON,
    TET + REH + YEH,
    GAF + REH + YEH,
    HEH + ALEF + YEH,
    ALEF + MEEM,
    GAF + REH,
    TET + REH,
    ALEF + YEH
  ] + PLURAL_FORMS

  def stem
    stem_suffix
    @word = word.strip
  end

  private

  def stem_suffix
    filter_rules(SUFFIXES).each do |suffix|
      if word.end_with?(suffix)
        @word = word[0..-(suffix.length + 1)]
        break
      end
    end
  end
end
