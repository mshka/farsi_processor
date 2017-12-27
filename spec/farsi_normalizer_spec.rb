require 'spec_helper'

describe FarsiNormalizer do
  it 'normalize arabic letters to farsi' do
    data = {
      'كتلت' => 'کتلت',
      'بسکويت' => 'بسکویت',
      'بسکوىت' => 'بسکویت',
      'كىساديا' => 'کیسادیا',
      'رمــــان' => 'رمان',
      'بُشقابِ مَن را بِگیر' => 'بشقاب من را بگیر',
      'آفوگاتو' => 'افوگاتو',
      'أفوگاتو' => 'افوگاتو',
      'إفوگاتو' => 'افوگاتو'
    }

    data.each do |before, after|
      expect(FarsiNormalizer.process(before)).to eq(after)
    end
  end

  it 'has an only character option' do
    expect(FarsiNormalizer.process('بسكويت', only: ['ك'])).to eq('بسکويت')
  end

  it 'has an expect character option' do
    expect(FarsiNormalizer.process('بسكويت', except: ['ك'])).to eq('بسكویت')
  end
end
