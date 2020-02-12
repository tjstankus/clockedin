# frozen_string_literal: true

require_relative "../spec_helper"

module Clockedin
  RSpec.describe ClockEntry do
    let(:line) {
      "CLOCK: [2020-02-10 Mon 19:00]--[2020-02-10 Mon 19:58] =>  0:58"
    }
    let(:entry) { ClockEntry.new(line) }

    context "timestamps" do
      it "parses starts at time" do
        expect(entry.starts_at.year).to eq(2020)
        expect(entry.starts_at.month).to eq(2)
        expect(entry.starts_at.mday).to eq(10)
        expect(entry.starts_at.hour).to eq(19)
        expect(entry.starts_at.minute).to eq(0)
      end

      it "parses ends at time" do
        expect(entry.ends_at.year).to eq(2020)
        expect(entry.ends_at.month).to eq(2)
        expect(entry.ends_at.mday).to eq(10)
        expect(entry.ends_at.hour).to eq(19)
        expect(entry.ends_at.minute).to eq(58)
      end
    end

    it "identifies entry line"
    it "disregards non-entry line"
  end
end
