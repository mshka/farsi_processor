require 'spec_helper'

describe FarsiProcessor do
  describe '#normalize' do
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
        expect(FarsiProcessor.normalize(before)).to eq(after)
      end
    end

    it 'has an only character option' do
      expect(FarsiProcessor.normalize('بسكويت', only: ['ك'])).to eq('بسکويت')
    end

    it 'has an expect character option' do
      expect(FarsiProcessor.normalize('بسكويت', except: ['ك'])).to eq('بسكویت')
    end
  end
end
