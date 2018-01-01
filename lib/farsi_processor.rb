require 'farsi_processor/version'
require_relative 'normalizer'
require_relative 'stemmer'

class FarsiProcessor
  include Normalizer
  include Stemmer

  def self.process(word, options = {})
    new(word, options).process
  end

  def self.normalize(word, options = {})
    new(word, options).normalize
  end

  def self.stem(word, options = {})
    new(word, options).stem
  end

  attr_reader :word, :options, :excepts, :onlys

  def initialize(word, options = {})
    @word = word
    @options = options

    @onlys = []
    @excepts = []
    if options[:only]
      @onlys = options[:only]
    elsif options[:except]
      @excepts = options[:except]
    end
  end

  def process
    normalize
    stem
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
end
