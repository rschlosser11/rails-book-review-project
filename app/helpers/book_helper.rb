module BookHelper
  def book_exist(id)
    if id && !Book.where(id: id).empty?
      {include_blank: true, selected: id}
    else
      {include_blank: true}
    end
  end

  def cover_exist(book)
    if book.cover.attachment
      image_tag(book.cover, class: "article-img", alt: "book cover")
    else
      image_tag('bookmania-logo.png', class: "article-img", alt: "book cover")
    end
  end
end
