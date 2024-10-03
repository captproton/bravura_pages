# BravuraPages

BravuraPages is a powerful Rails engine that simplifies the creation and management of static pages in your Rails application.

[![Gem Version](https://badge.fury.io/rb/bravura_pages.svg)](https://badge.fury.io/rb/bravura_pages)
[![Build Status](https://travis-ci.org/yourusername/bravura_pages.svg?branch=main)](https://travis-ci.org/yourusername/bravura_pages)
[![Coverage Status](https://coveralls.io/repos/github/yourusername/bravura_pages/badge.svg?branch=main)](https://coveralls.io/github/yourusername/bravura_pages?branch=main)

## Table of Contents

- [BravuraPages](#bravurapages)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Configuration](#configuration)
  - [Customization](#customization)
  - [Troubleshooting](#troubleshooting)
  - [Development](#development)
  - [Contributing](#contributing)
  - [License](#license)

## Features

BravuraPages offers a range of features to enhance your Rails application:

- **CRUD Operations**: Easily create, read, update, and delete static pages.
- **Customizable Views**: Fully customizable views and styling to match your application's design.
- **Seamless Integration**: Effortlessly integrates with existing Rails applications.
- **Admin Interface**: A user-friendly admin interface for managing pages.
- **SEO-friendly URLs**: Automatically generates SEO-friendly URLs for your static pages.

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

**Note**: BravuraPages is compatible with Rails 6.0 and above.

## Usage

After installation, you can access the static pages at `/static_pages` in your application. Here are some key features:

- View all static pages: `/static_pages`
- Create a new static page: `/static_pages/new`
- View a specific static page: `/static_pages/:id`
- Edit a static page: `/static_pages/:id/edit`

Example of creating a new static page in your controller:

```ruby
@page = BravuraPages::Page.new(title: 'About Us', content: 'Welcome to our company!')
@page.save
```

Rendering a static page in your view:

```erb
<%= render_bravura_page('about-us') %>
```

## Configuration

You can configure BravuraPages in the initializer file created by the install generator (`config/initializers/bravura_pages.rb`):

```ruby
BravuraPages.setup do |config|
  config.page_title_prefix = 'My App - '
  config.admin_authorization = -> (controller) { controller.current_user.admin? }
end
```

## Customization

To customize the views, you can copy them to your main app:

```bash
rails generate bravura_pages:views
```

This will copy all views into `app/views/bravura_pages/` in your main app, where you can modify them.

## Troubleshooting

If you encounter issues, try the following:

1. Ensure all migrations are run: `rails db:migrate`
2. Check your routes file for proper mounting of BravuraPages
3. Clear your cache: `rails tmp:cache:clear`

If problems persist, please [open an issue](https://github.com/yourusername/bravura_pages/issues).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Please make sure to update tests as appropriate.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).