class TextShout < ActiveRecord::Base
  searchable do
    text :body
  end
end
