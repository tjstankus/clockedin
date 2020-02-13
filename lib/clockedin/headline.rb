# frozen_string_literal: true

module Clockedin
  class Headline
    KEYWORDS = %w(TODO NEXT WIP DONE)

    def self.parse(headline)
      new(headline).tap { |h| h.parse }
    end

    attr_reader :raw_line_parts, :level, :title

    def initialize(raw_line)
      @raw_line_parts = raw_line.split.reject(&:empty?)
    end

    def parse
      match_data =
        /^(?<stars>\*+)                     # 1 or more stars
        \s*                                 # whitespace
        (?<keyword>#{KEYWORDS.join("|")})*  # 0 or more keywords
        \s*                                 # whitespace
        (?<title>.*)                        # title
        /x                                  # regex free-spacing mode
        .match(untagged_line)               # match on untagged line
      @level = match_data[:stars].length
      @title = match_data[:title]
    end

    def untagged_line
      if tags.any?
        raw_line_parts[0...-1].join(" ")
      else
        raw_line_parts.join(" ")
      end
    end

    def tags
      @tags ||= Tags.new(raw_line_parts.last).tags
    end
  end
end
