require "date"

module Clockedin
  class ClockEntry
    attr_reader :line, :time_span

    def initialize(line)
      @line = line 
      @time_span = init_time_span
    end

    def starts_at
      time_span.starts_at
    end

    def ends_at
      time_span.ends_at
    end

    private

    def init_time_span
      TimeSpan.new(timestamps[:starts_at], timestamps[:ends_at])
    end

    def timestamps
      match_data = /CLOCK\: \[(.+?)(?=\])\]--\[(.+?)(?=\])/.match(line)
      starts_at, ends_at = match_data[1], match_data[2]
      { starts_at: DateTime.parse(starts_at),
        ends_at: DateTime.parse(ends_at) }
    end
  end
end
