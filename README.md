# Jungle

A mini e-commerce application built with Ruby on Rails that allows visitors or registered users to view and purchase products. The admin after authentication can add/delete products and add new categories to the site.

## Screenshots

Homepage
!["Homepage for a logged in user"](./docs/jungle-homepage.png)

Product Page
!["A Product view page"](./docs/jungle-product-page.png)

Cart View Page
!["The view cart page"](./docs/jungle-cart.png)

View Order Page
!["Order page after payment"](./docs/jungle-order-view-page.png)

Admin Dashboard (These admin routes require authentication)
!["Admin dashboard"](./docs/jungle-admin-dashboard.png)

Admin Products View
!["Admin edit products page"](./docs/jungle-admin-edit-products.png)

Admin Categories View
!["Admin add categories page"](./docs/jungle-admin-add-categories.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Ruby 3.1
- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Sass Rails
- Font Awesome Rails
- RMagick
- Money Rails
- Bcrypt 3.1
- Stripe
