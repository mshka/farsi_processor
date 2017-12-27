require 'farsi_processor/version'

class FarsiStemmer
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

  def self.process(word, options = {})
    new(word, options).process
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

  def process
    stem_suffix
    word.strip
  end

  private

  def filter_rules(group)
    if excepts.any?
      group.reject { |k, _v| excepts.include?(k) }
    elsif onlys.any?
      group.select { |k, _v| onlys.include?(k) }
    else
      group
    end
  end

  def stem_suffix
    filter_rules(SUFFIXES).each do |suffix|
      if word.end_with?(suffix)
        @word = word[0..-(suffix.length + 1)]
        break
      end
    end
  end
end
