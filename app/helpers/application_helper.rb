module ApplicationHelper

  def sort_by_date_desc(obj_array)
    obj_array.order(:updated_at).reverse
  end

end
