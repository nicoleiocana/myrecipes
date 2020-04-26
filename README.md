# Myrecipes Project

_The best recipe sharing app!_ Myrecipes website created from
[Udemy's The Professional Ruby on Rails Developer with Rails 5](https://www.udemy.com/course/pro-ruby-on-rails-rails5/)
by Mashrur Hossain and Rob Percival. Additional components were added to the application:
likes functionality and images integration. This social experience capitalizes on
**ActionCable** with realtime features such as a chatroom and comments. Test Driven
Development (TDD) is implemented throughout the site building process. Other notable features:
* an authentication system built from scratch
* user interface (UI) styled with Bootstrap
* file/image hosting from Amazon Web Services (AWS)
* [Gravatars](https://en.gravatar.com/)
* model and non-model backed forms
* one-to-many and many-to-many associations at the database layer

There are notable modifications that distinguish my My Recipes application from others. I have listed them to benefit others who may utilize my code to expand upon their own:

| Issue | Resolution |
|-------|------------|
| styling on the .well class excluded  | ``` /*.well { margin-bottom: 10px; } */``` in the `application.scss` file |
| align the **Add Image** label across from the _Choose File_ button | ```.form-horizontal .control-label { padding-top: 0; }``` in the `application.scss` file |
| padding added to the image in the `show.html.erb` page | ```.custom-image-style { padding-bottom: 20px; }``` in the `application.scss` file |
| _likes_ section goes out of bounds on mobile view | delete row in ```<div class="row col-md-8 col-md-offset-2">``` in both the `show.html.erb` & `_recipes.html.erb` files |
| ```redirect_to :back``` depreciated | ```redirect_to request.referrer``` in the `recipes_controller.rb` file|
| **Active Storage** used in development environment | excluded ```gem 'carrierwave', '0.11.2'; gem 'fog'``` |
| | ```$ rails active_storage:install``` then  ```$ rails db:migrate``` |
| | ```has_one_attached :image``` in the `recipe.rb` file (Recipe model) |
| | ```@recipe.image.attach(params[:recipe][:image])``` in the `create` method in the `recipes_controller.rb` file |
| | embedded ruby code updated to ```<%= image_tag(@recipe.display_image, class: "custom-image-style") if @recipe.image.attached? %>``` |
| image validations added on both front-end and back-end | ```gem 'active_storage_validations', '~> 0.8.8''``` in the Gemfile |
| | ```validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" }, size: { less_than: 5.megabytes, message: "should be less than 5MB" }``` added in `recipe.rb` file |
| | ```<script type="text/javascript"> $("#recipe_image").bind("change", function() { const size_in_megabytes = this.files[0].size/1024/1024; if (size_in_megabytes > 5) { alert("Maximum file size is 5MB. Please choose a smaller file."); $("#recipe_image").val(""); } }); </script>``` added at bottom of `_form..html.erb` file |
| image resizing supplemented with  image processing gem | ```gem 'image_processing', '~> 1.10', '>= 1.10.3'``` in the Gemfile |
| | ```# Returns a resized image for display. def display_image image.variant(combine_options: { auto_orient: true, gravity: "center", resize: "250x250^", crop: "250x250+0+0" }) end``` in the `recipe.rb` file|
| images break on mobile view on `show.html.erb` page | ```.well``` now takes up 10 columns ```<div class="col-md-10 well">```|
| | ```image_tag```'s class changed from ```col-md-2``` to ```pull-right``` and inserted before ```<h4></h4>```|

## Installation

1\. Clone the repo.

![clone repo](https://i.imgur.com/VQSm78b.png)

2\. Install the needed gems:

```
$ bundle install --without production
```

3\. Migrate the database:

```
$ rails db:migrate
```

4\. Verify all tests pass:

```
$ rails test
```

5\. Run the app on http://localhost:3000. 

```
$ rails s
```

-----

## Screenshots

Desktop:

![desktop myrecipes](https://i.imgur.com/vA4AwMi.png)

Mobile:

![mobile myrecipes](https://i.imgur.com/8HvxjTq.png)

-----

### Screen Capture

![chefchat demo](https://i.imgur.com/q05S2wz.gif)