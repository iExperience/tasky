== README

This app is a simple project management app with the goal of demonstrating:
- Rails relations
- Search
- Pagination
- File Attachments
- AJAX
- A sense of style... ;)

In addition to the app code, this project has a seeds.rb file that you can use to setup your local instance of the app with some sample data.

To get the app up and running:
```
rake db:migrate
rake db:seed
```

The app is configured to have Puma, you can optionally use it as a faster and better alternative to Webrick. To run the server with puma:
```
rails s puma
```

The app is also bundled with a few nice gems for development, such as ```jazz_hands```. If you have issues installing them, you can remove them from the Gemfile and just use ```pry```, or none of those. The gems under the development group in the Gemfile are not necessary, and just used to enhance developer experience.