# Jungle

A mini e-commerce application built with Rails 4.2.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Run `bin/rake db:reset` to create, load and seed db
4. Create .env file based on .env.example
5. Sign up for a Stripe account
6. Put Stripe (test) keys into appropriate .env vars
7. Run `bin/rails s -b 0.0.0.0` to start the server

## Screenshots

![Home with user logged in](https://github.com/BryceWalter/jungle-rails/blob/master/data/home_logged_in.png)
![Registration Page](https://github.com/BryceWalter/jungle-rails/blob/master/data/register.png)
![Admin Category Control](https://github.com/BryceWalter/jungle-rails/blob/master/data/admin_category_control.png)
![Admin Product Control](https://github.com/BryceWalter/jungle-rails/blob/master/data/admin_product_control.png)
![Empty Cart View](https://github.com/BryceWalter/jungle-rails/blob/master/data/empty%20_cart_error.png)
![Cart View](https://github.com/BryceWalter/jungle-rails/blob/master/data/cart.png)
![Stripe Pay](https://github.com/BryceWalter/jungle-rails/blob/master/data/stripe_pay.png)
![Order Confirmation Page](https://github.com/BryceWalter/jungle-rails/blob/master/data/order_confirmation.png)
![Product View](https://github.com/BryceWalter/jungle-rails/blob/master/data/single_product_view.png)
![Product Reviews](https://github.com/BryceWalter/jungle-rails/blob/master/data/reviews.png)


## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
