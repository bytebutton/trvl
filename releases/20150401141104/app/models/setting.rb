class Setting < Base::VersionModel

  class << self

    def by_key(key)
      where({:key => key}).first
    end

    def timatic_request_counter
      setting = by_key('timatic_request')
      setting.update_attributes!({:value => (setting.value.to_i + 1)})
      setting.value
    end

    def method_missing(code)
      value = by_key(code.to_s).value
      return true if value == '1'
      return false if value == '0'
      value
    end

  end

end
