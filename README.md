# BravuraPages

BravuraPages is a Rails engine that allows users to create and manage static pages. It provides a simple and flexible way to add static page functionality to your Rails application.

## Features

- Create, read, update, and delete static pages
- Customizable views and styling
- Easy integration with existing Rails applications

## Installation

Add this line to your application's Gemfile:

```ruby
gem "bravura_pages"
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install bravura_pages
```

After installing the gem, run the installation generator:

```bash
rails generate bravura_pages:install
```

This will:
- Copy the initializer file to your application
- Mount the BravuraPages engine in your routes file

Finally, run the migrations:

```bash
rails bravura_pages:install:migrations
rails db:migrate
```

## Usage

After installation, you can access the static pages at `/static_pages` in your application. Here are some key features:

- View all static pages: `/static_pages`
- Create a new static page: `/static_pages/new`
- View a specific static page: `/static_pages/:id`
- Edit a static page: `/static_pages/:id/edit`

You can customize the appearance and behavior of BravuraPages by overriding its views, controllers, and models in your main application.

## Configuration

You can configure BravuraPages in the initializer file created by the install generator (`config/initializers/bravura_pages.rb`):

```ruby
BravuraPages.setup do |config|
  # Add your configuration options here
end
```

## Customization

To customize the views, you can copy them to your main app:

```bash
rails generate bravura_pages:views
```

This will copy all views into [`app/views/bravura_pages/`](command:_github.copilot.openRelativePath?%5B%7B%22scheme%22%3A%22file%22%2C%22authority%22%3A%22%22%2C%22path%22%3A%22%2FUsers%2Fcarltanner%2Fdev%2Fruby%2Fgems%2Fbravura_pages%2Fapp%2Fviews%2Fbravura_pages%2F%22%2C%22query%22%3A%22%22%2C%22fragment%22%3A%22%22%7D%2C%22262f576f-19aa-4153-8532-ebc1b7d8290a%22%5D "/Users/carltanner/dev/ruby/gems/bravura_pages/app/views/bravura_pages/") in your main app, where you can modify them.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Please make sure to update tests as appropriate.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).