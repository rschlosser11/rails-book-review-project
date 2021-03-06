module ReviewsHelper
  def rating_image(rating)
    if rating == 1
      image_tag ("1-star.png"), class: "rating", alt: "rating"
    elsif rating == 1.5
      image_tag ("1-half-stars.png"), class: "rating", alt: "rating"
    elsif rating == 2
      image_tag ("2-stars.png"), class: "rating", alt: "rating"
    elsif rating == 2.5
      image_tag ("2-half-stars.png"), class: "rating", alt: "rating"
    elsif rating == 3
      image_tag ("3-stars.png"), class: "rating", alt: "rating"
    elsif rating == 3.5
      image_tag ("3-half-stars.png"), class: "rating", alt: "rating"
    elsif rating == 4
      image_tag ("4-stars.png"), class: "rating", alt: "rating"
    elsif rating == 4.5
      image_tag ("4-star.png"), class: "rating", alt: "rating"
    elsif rating == 5
      image_tag ("5-stars.png"), class: "rating", alt: "rating"
    else
      image_tag ("no-stars.png"), class: "rating", alt: "rating"
    end
  end

  def display_created_at(model)
    model.created_at.strftime('%B %e, %Y')
  end

  def delete_review(review)
    if current_user && current_user.id == review.user_id
      button_to "Delete Review", review_path(review), method: :delete, class: "btn"
    end
  end
  def edit_review(review)
    if current_user && current_user.id == review.user_id
      button_to "Edit Review", edit_review_path(review), method: :get, class: "btn"
    end
  end
end
