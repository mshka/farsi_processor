require 'spec_helper'

describe FarsiProcessor do
  describe '#stem' do
    it 'removes suffixes from the end words' do
      data = {
        'قارچ ها' => 'قارچ',
        'قارچها' => 'قارچ',
        'آلبالوها' => 'آلبالو',
        'زنان' => 'زن',
        'کودکان' => 'کودک',
        'ایرانیان' => 'ایرانی',
        'مایعات' => 'مایع',
        'قطعات' => 'قطع',
        'دخترای' => 'دختر',
        'دخترها' => 'دختر',
        'محبوبتر' => 'محبوب',
        'محبوبترین' => 'محبوب',
        'محبوبترین ها' => 'محبوبترین',
        'محبوبترین های' => 'محبوبترین',
        'حسابگر' => 'حساب',
        'حسابگری' => 'حساب',
        'ریاضیات' => 'ریاضی',
        'دخترام' => 'دختر'
      }

      data.each do |before, after|
        expect(FarsiProcessor.stem(before)).to eq(after)
      end
    end

    it 'stops after stemming first sufix found' do
      expect(FarsiProcessor.stem('دخترهای')).to eq('دختر')
    end

    it 'has an only character option' do
      expect(FarsiProcessor.stem('دخترهای', only: ['ای'])).to eq('دختره')
    end

    it 'has an expect character option' do
      expect(FarsiProcessor.stem('دخترهای', except: ['های'])).to eq('دختره')
    end
  end
end
