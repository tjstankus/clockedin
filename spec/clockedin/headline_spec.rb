require_relative "../spec_helper"

module Clockedin
  RSpec.describe Headline do
    let(:headline) { "*** Headline with tags :foo:bar_baz:" } 

    it "parses level 3" do
      expect(Headline.parse(headline).level).to eq(3)
    end

    it "parses level 1" do
      headline = "* DONE Write README"
      expect(Headline.parse(headline).level).to eq(1)
    end

    it "parses title with tags" do
      expect(Headline.parse(headline).title).to eq("Headline with tags")
    end

    it "parses title without tags" do
      headline = "* DONE Write README"
      expect(Headline.parse(headline).title).to eq("Write README")
    end

    it "parses tags" do
      expect(Headline.parse(headline).tags).to match_array(%w(foo bar_baz))
    end

    it "includes parent headline tags"
    it "includes file tags"

    it "strips extra whitespace" do
      headline = "*  DONE  Write README"
      expect(Headline.parse(headline).title).to eq("Write README")
      expect(Headline.parse(headline).level).to eq(1)
    end
  end
end
