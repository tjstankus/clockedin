# frozen_string_literal: true

require_relative "../spec_helper"

module Clockedin
  RSpec.describe Document do
    let(:sample_doc_path) {
      File.join(File.dirname(__FILE__), "../fixtures/sample.org")
    }

    it "reads file" do
      doc = Document.new(sample_doc_path)
      expect(doc.lines).not_to be_empty
    end

    # it "parses tags"
    # it "parses headlines"
    # it "parses clock entries"
  end
end

