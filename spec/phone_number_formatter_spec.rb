require "spec_helper"

describe PhoneNumberFormatter do
  it "formats phone numbers like (650) 123-1234" do
    expect(PhoneNumberFormatter.new("650-123-1234").format).to eq "(650) 123-1234"
    expect(PhoneNumberFormatter.new("650 123 1234").format).to eq "(650) 123-1234"
    expect(PhoneNumberFormatter.new("650 123-1234").format).to eq "(650) 123-1234"
    expect(PhoneNumberFormatter.new("650-123 1234").format).to eq "(650) 123-1234"
    expect(PhoneNumberFormatter.new("(650) 123 1234").format).to eq "(650) 123-1234"
    expect(PhoneNumberFormatter.new("6501231234").format).to eq "(650) 123 1234"
    expect(PhoneNumberFormatter.new("    6501231234    ").format).to eq "(650) 123-1234"
  end

  it "passes badly-formatted numbers through unchanged" do
    expect(PhoneNumberFormatter.new("650 123 123").format).to eq "650 123 123"
    expect(PhoneNumberFormatter.new("650x123x1234").format).to eq "650x123x1234"
  end
end
