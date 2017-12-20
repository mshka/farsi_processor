require "spec_helper"

describe FarsiNormalizer do
  it "has a version number" do
    expect(FarsiNormalizer::VERSION).not_to be nil
  end

  it "normalize letters from beginning of word" do
    data = {
      "کتلت" => "كتلت"
    }

    data.each do |before, after|
      expect(FarsiNormalizer.normalize(before)).to eq(after)
    end
  end
end
