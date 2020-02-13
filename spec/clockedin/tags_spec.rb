# frozen_string_literal: true

require_relative "../spec_helper"

module Clockedin
  RSpec.describe Tags do
    describe "#tags" do
      context "given non tags string" do
        it "returns empty array" do
          expect(Tags.new("not tags").tags).to be_empty
        end
      end

      context "given tags string" do
        it "returns array of tags" do
          expect(Tags.new(":foo:bar_baz:").tags).to match_array(%w(foo bar_baz))
        end
      end
    end
  end
end
