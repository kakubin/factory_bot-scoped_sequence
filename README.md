# FactoryBot::ScopedSequence

FactoryBot::ScopedSequence is an extension to add scope to factory_bot's sequence

## Installation

Add to the application's Gemfile

```Gemfile
group :test do
  gem 'factory_bot-scoped_sequence'
end
```

## Usage

```rb
FactoryBot.define do
  factory :todo_list do
  end
end

FactoryBot.define do
  factory :todo_list_item do
    association :todo_list
    sequence(:priority, scope: :todo_list_id)
  end
end


attributes_for(:todo_list_item, todo_list_id: 1) # => {:todo_list_id=>1, :priority=>1}
attributes_for(:todo_list_item, todo_list_id: 1) # => {:todo_list_id=>1, :priority=>2}
attributes_for(:todo_list_item, todo_list_id: 2) # => {:todo_list_id=>2, :priority=>1}

todo_list = create(:todo_list)
attributes_for(:todo_list_item, todo_list: todo_list) # => {:todo_list_id=>3, :priority=>1}
attributes_for(:todo_list_item, todo_list: todo_list) # => {:todo_list_id=>3, :priority=>2}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kakubin/factory_bot-scoped_sequence.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
