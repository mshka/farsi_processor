require 'spec_helper'

describe FarsiProcessor do
  it 'has a version number' do
    expect(FarsiProcessor::VERSION).not_to be nil
  end

  it 'normalize and stem words' do
    data = {
      'كتلت' => 'کتلت',
      'بسکويت' => 'بسکویت',
      'حسابگر' => 'حساب',
      'حسابگری' => 'حساب'
    }

    data.each do |before, after|
      expect(FarsiProcessor.process(before)).to eq(after)
    end
  end

  it 'can just normalize words' do
    data = {
      'كتلت' => 'کتلت',
      'بسکويت' => 'بسکویت',
      'حسابگر' => 'حسابگر',
      'حسابگری' => 'حسابگری'
    }

    data.each do |before, after|
      expect(FarsiProcessor.normalize(before)).to eq(after)
    end
  end

  it 'can just stem words' do
    data = {
      'كتلت' => 'كتلت',
      'بسکويت' => 'بسکويت',
      'حسابگر' => 'حساب',
      'حسابگری' => 'حساب'
    }

    data.each do |before, after|
      expect(FarsiProcessor.stem(before)).to eq(after)
    end
  end
end
