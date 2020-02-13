module Clockedin
  class Document
    attr_reader :lines

    def initialize(path)
      @lines = File.readlines(path)
    end

    def parse
    end
  end
end
