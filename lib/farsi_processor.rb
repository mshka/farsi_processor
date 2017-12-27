require 'farsi_processor/version'
require_relative 'farsi_normalizer'
require_relative 'farsi_stemmer'

class FarsiProcessor
  def self.process(word, options = {})
    new(word, options).process
  end

  def self.normalize(word, options = {})
    new(word, options).normalize
  end

  def self.stem(word, options = {})
    new(word, options).stem
  end

  attr_reader :word, :options

  def initialize(word, options = {})
    @word = word
    @options = options
  end

  def process
    normalize
    stem
  end

  def normalize
    @word = FarsiNormalizer.process(word, options)
  end

  def stem
    @word = FarsiStemmer.process(word, options)
  end
end
