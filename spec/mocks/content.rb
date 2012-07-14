require File.join(File.dirname(__FILE__), 'super_class')

class Content < SuperClass
  attr_accessor :body, :visibility, :published_at
end

Sunspot.setup(Content) do
  text :body
  float :visibility
  time :published_at
end

