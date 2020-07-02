module BookHelper
  def book_exist(id)
    if id && !Book.where(id: id).empty?
      {include_blank: true, selected: id}
    else
      {include_blank: true}
    end
  end
end
