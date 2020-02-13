# frozen_string_literal: true

module Clockedin
  class Tags
    attr_reader :candidate

    def initialize(candidate)
      @candidate = candidate
    end

    def tags
      if tags?
        candidate.split(":").reject(&:empty?)
      else
        []
      end
    end
    
    def tags?
      candidate.start_with?(":") && candidate.end_with?(":")
    end
  end
end
