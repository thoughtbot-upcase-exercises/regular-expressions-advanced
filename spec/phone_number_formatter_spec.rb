require "spec_helper"

describe PhoneNumberFormatter do
  describe "successfully formatting a number to look like (650) 123-1234" do
    it "formats a number like 650-123-1234" do
      expect(PhoneNumberFormatter.new("650-123-1234").format_number).to eq "(650) 123-1234"
    end

    it "formats a number with spaces instead of dashes" do
      expect(PhoneNumberFormatter.new("650 123 1234").format_number).to eq "(650) 123-1234"
    end

    it "formats a number with spaces and dashes" do
      expect(PhoneNumberFormatter.new("650 123-1234").format_number).to eq "(650) 123-1234"
      expect(PhoneNumberFormatter.new("650-123 1234").format_number).to eq "(650) 123-1234"
    end

    it "formats a number with parentheses and spaces" do
      expect(PhoneNumberFormatter.new("(650) 123 1234").format_number).to eq "(650) 123-1234"
    end

    it "formats a number with no separators at all" do
      expect(PhoneNumberFormatter.new("6501231234").format_number).to eq "(650) 123-1234"
    end

    it "formats a number with spaces at both ends" do
      expect(PhoneNumberFormatter.new("    6501231234    ").format_number).to eq "(650) 123-1234"
    end

    it "formats a number separated by x's" do
      expect(PhoneNumberFormatter.new("650x123x1234").format_number).to eq "(650) 123-1234"
    end
  end

  it "passes badly-formatted numbers through unchanged" do
    expect(PhoneNumberFormatter.new("650 123 123").format_number).to eq "650 123 123"
  end

  it "can handle numbers with international codes" do
    pending "After getting all the other specs passing, remove this 'pending' line"

    expect(PhoneNumberFormatter.new("+16501231234").format_number).to eq "+1 (650) 123-1234"
  end
end
