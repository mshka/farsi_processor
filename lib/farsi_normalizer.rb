require "farsi_normalizer/version"

class FarsiNormalizer
  ARABIC_KAF = "\UFED9" #ﻙ
  FARSI_KEHEH = "\U06A9" #ک
  YAY = "\UFEF1" #ﻱ
  ALEF_MAKSOURA = "\UFEEF" #ﻯ
  ALEF = "\UFE8D" #ﺍ
  ALEF_MADDA = "\UFE81" #ﺁ

  CHARACTERS_MAPPINGS = {
    ARABIC_KAF => FARSI_KAF,
    YAY => ALEF_MAKSOURA
  }

  CHARACTERS_AT_BEGINING_OF_WORD_MAPPINGS = {
    ALEF => ALEF_MADDA
  }

  def self.normalize(word, options = {})
    new(word, options).normalize
  end

  attr_reader :word, :excepts, :onlys

  def initialize(word, options = {})
    @word = word.dup
    @onlys = options[:only].presence || []
    @excepts = options[:except].presence || []
  end

  def normalize
    normalize_charachter_at_begining_of_word
    normalize_charachters
  end

  private

    def rules(rule_set)
      if excepts.any?
        rule_set.reject { |k, v| excepts.include?(k) }
      elsif
        rule_set.select { |k, v| onlys.include?(k) }
      end
    end

    def normalize_charachter_at_begining_of_word
      rules(CHARACTERS_AT_BEGINING_OF_WORD_MAPPINGSA).each do |match, replacement|
        if word.start_with?(match)
          word.sub!(match, replacement)
        end
      end
    end

    def normalize_charachters
      rules(CHARACTERS_AT_BEGINING_OF_WORD_MAPPINGSA).each do |match, replacement|
        word.gsub!(match, replacement)
      end
    end
end
