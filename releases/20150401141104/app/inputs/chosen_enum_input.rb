class ChosenEnumInput < ChosenInput
  def input
    options[:collection] ||= @builder.object.class.send(attribute_name.to_s.pluralize).map { |i| [i.first, i.first.titleize] }
    options[:value_method] = :first
    options[:label_method] = :last
    super
  end
end
