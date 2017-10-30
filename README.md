# NullifyEmpty

This gem allows to store string or text Rails model attributes as NULL in DB when they have empty values.
It is very useful when you need to avoid `""` values coming from blank form inputs or anywhere else to be stored in DB.

Having empty values in DB is not allowed when there is unique constraint on the column or uniqueness validation on the field, while presence of the values is not required. Unique constraint ignores nulls in most DBMS.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nullify_empty'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install nullify_empty

## Usage

Use `nullify_empty` method in the model to specify attributes that must not have empty values stored as empty strings in DB:

``` ruby
class User < ApplicationRecord
  nullify_empty :email, :phone
end
```


``` ruby
params = {email: "", phone: "", ...}
user = User.create(params) # => #<User id: 1, email: nil, phone: nil, ... > 

user.email = ""
user.email # => nil

user.update(email: "")
user.email # => nil

user.update_column :email, ""
user.email # => nil

```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chumakoff/nullify_empty. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
