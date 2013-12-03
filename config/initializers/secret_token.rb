# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Details::Application.config.secret_key_base = '63b5b1b9fde440458a2dbdf641c98d63f6d1593f42bb5a6816e7c19cd0b0af9c2de09d47d0a590395b0966a9e8e419cc6815a570108cc22b1a4d93597a041ae3'
Details::Application.config.secret_token = ENV['SECRET_TOKEN']

