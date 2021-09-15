require 'bcrypt'
require_relative '../models/user.rb'

username = 'test'
email = 'test@test.com'
password = "test"

password_digest = BCrypt::Password.create(password)


create_user(username, email, password_digest)