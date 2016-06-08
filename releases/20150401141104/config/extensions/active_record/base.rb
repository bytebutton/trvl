module CustomizedFindOrCreate
  def find_and_update_or_create(key_attributes, items_attributes, options = {})
    options.reverse_merge!(:update_if_exists => true, :forbid_create => false)
    items_attributes = [items_attributes] unless items_attributes.is_a?(Array)
    key_attributes = [key_attributes] unless key_attributes.is_a?(Array)
    match_with_all_attributes = false
    if key_attributes.include?("*")
      key_attributes = []
      match_with_all_attributes = true
    end
    items_attributes.each_with_index.collect do |item_attributes, item_index|
      key_values = match_with_all_attributes ? item_attributes : item_attributes.slice(*key_attributes)
      raise "Key attributes not present" if options[:raise_exceptions] && key_attributes.any? && key_values.blank?
      item = key_values.any? ? where(key_values).first : nil
      return nil if item_index == 0 && options[:no_op_if_exist] && item
      # note: use when testing on a fresh db - seeds.rb should not contain any entries with same key attributes:
      #   raise "Duplicate item matching the attributes: #{item_attributes}" if item
      if item && options[:update_if_exists]
        (options[:raise_exceptions] ? item.update_attributes!(item_attributes) : item.update_attributes(item_attributes))
      end
      item ||= (options[:raise_exceptions] ? create!(item_attributes) : create(item_attributes)) unless options[:forbid_create]
      item
    end
  end
  alias :update_or_create :find_and_update_or_create
  alias :create_or_update :find_and_update_or_create

  def find_and_update_or_create!(key_fields, attributes, options = {})
    find_and_update_or_create(key_fields, attributes, options.merge(:raise_exceptions => true))
  end
  alias :update_or_create! :find_and_update_or_create!
  alias :create_or_update! :find_and_update_or_create!

  def find_or_create(key_fields, attributes, options = {})
    find_and_update_or_create(key_fields, attributes, options.merge(:update_if_exists => false))
  end

  def find_or_create!(key_fields, attributes, options = {})
    find_or_create(key_fields, attributes, options.merge(:raise_exceptions => true))
  end

  def update_if_exists(key_fields, attributes, options = {})
    find_and_update_or_create(key_fields, attributes, options.merge(:update_if_exists => true, :forbid_create => true))
  end

  def update_if_exists!(key_fields, attributes, options = {})
    update_if_exists(key_fields, attributes, options.merge(:raise_exceptions => true))
  end

end

ActiveRecord::Base.send(:extend, CustomizedFindOrCreate)