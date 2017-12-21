require "farsi_normalizer/version"

class FarsiNormalizer
  ARABIC_KAF = "\UFED9" #ﻙ
  FARSI_KEHEH = "\U06A9" #ک
  YAY = "\UFEF1" #ﻱ
  ALEF_MAKSOURA = "\UFEEF" #ﻯ

  CHARACTERS_MAPPINGS = {
    ARABIC_KAF => FARSI_KEHEH,
    YAY => ALEF_MAKSOURA
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
  end

  private

    def rules(rule_set)
      if excepts.any?
        rule_set.reject { |k, v| excepts.include?(k) }
      elsif onlys.any?
        rule_set.select { |k, v| onlys.include?(k) }
      else
        rule_set
      end
    end

    def normalize_charachters
      rules(CHARACTERS_MAPPINGS).each do |match, replacement|
        word.gsub!(match, replacement)
      end
    end
end
