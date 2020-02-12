module Clockedin
  class TimeSpan
    attr_reader :starts_at, :ends_at

    def initialize(starts_at, ends_at)
      @starts_at, @ends_at = starts_at, ends_at 
    end
  end
end
