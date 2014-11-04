require "spec_helper"

describe "matching_hello_case_insensitively" do
  it "matches 'hello'" do
    expect(matching_hello_case_insensitively).to match "hello"
  end

  it "matches 'heLLo'" do
    expect(matching_hello_case_insensitively).to match "heLLo"
  end

  it "does not match 'hi'" do
    expect(matching_hello_case_insensitively).not_to match "hi"
  end
end

describe "ends_with_hello" do
  it "matches 'hello'" do
    expect(ends_with_hello).to match "hello"
  end

  it "matches 'oh heLLo'" do
    expect(ends_with_hello).to match "oh heLLo"
  end

  it "does not match 'Hello there'" do
    expect(ends_with_hello).not_to match "Hello there"
  end

  it "does not match 'Hello\nthere'" do
    expect(ends_with_hello).not_to match "Hello\nthere"
  end
end

describe "say_it_again" do
  it "matches 'hello hello'" do
    expect(say_it_again).to match "hello hello"
  end

  it "matches 'hihi'" do
    expect(say_it_again).to match "hihi"
  end

  it "matches 'BLAH BLAH'" do
    expect(say_it_again).to match "BLAH BLAH"
  end

  it "does not match 'BLAH'" do
    expect(say_it_again).not_to match "BLAH"
  end
end
