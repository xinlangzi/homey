module ApplicationHelper
  def enum_options(enum, use_integer: false)
    enum.map{|k, v| [k.titleize, (use_integer ? v.to_s : k)] }
  end

  def date_label(property)
    property.serviced_apartments? ? "Being Occupied Until" : "Available Date"
  end
end
