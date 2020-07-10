# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
      author has many books, book has many reviews, genre has many books, review has many comments, user has many comments
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
      review belongs to a book, book belongs to a author, a book belongs to a genre, comment belongs to a user, comment belongs to a review, review belongs to a user
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
      author has many genres through books, genre has many authors through books, review has many users through comments, user has many books through reviews, user has many reviews through comments
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
      review has many users through comments, user has many reviews through comments
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
      comments has a content column
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    Review method recent - on homepage, book method title_start_with ie) localhost:3000/books?search=A&commit=Search
- [x] Include signup
- [x] Include login
- [x] Include logout
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
      Facebook
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
      books/[:book_id]/reviews/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
