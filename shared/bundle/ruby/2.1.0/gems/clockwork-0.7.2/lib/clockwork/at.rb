module Clockwork
  class At
    class FailedToParse < StandardError; end

    NOT_SPECIFIED = nil
    WDAYS = %w[sunday monday tuesday wednesday thursday friday saturday].each.with_object({}).with_index do |(w, wdays), index|
      [w, w.capitalize, w[0...3], w[0...3].capitalize].each do |k|
        wdays[k] = index
      end
    end

    def self.parse(at)
      return unless at
      case at
      when /^([[:alpha:]]+)\s(.*)$/
        if wday = WDAYS[$1]
          parsed_time = parse($2)
          parsed_time.wday = wday
          parsed_time
        else
          raise FailedToParse, at
        end
      when /^(\d{1,2}):(\d\d)$/
        new($2.to_i, $1.to_i)
      when /^\*{1,2}:(\d\d)$/
        new($1.to_i)
      when /^(\d{1,2}):\*\*$/
        new(NOT_SPECIFIED, $1.to_i)
      else
        raise FailedToParse, at
      end
    rescue ArgumentError
      raise FailedToParse, at
    end

    attr_writer :min, :hour, :wday

    def initialize(min, hour=NOT_SPECIFIED, wday=NOT_SPECIFIED)
      @min = min
      @hour = hour
      @wday = wday
      raise ArgumentError unless valid?
    end

    def ready?(t)
      (@min == NOT_SPECIFIED or t.min == @min) and
        (@hour == NOT_SPECIFIED or t.hour == @hour) and
        (@wday == NOT_SPECIFIED or t.wday == @wday)
    end

    private
    def valid?
      @min == NOT_SPECIFIED || (0..59).cover?(@min) &&
        @hour == NOT_SPECIFIED || (0..23).cover?(@hour) &&
        @wday == NOT_SPECIFIED || (0..6).cover?(@wday)
    end
  end
end
