class Author < QuranApiRecord
  has_many :translated_names, as: :resource
  has_many :resource_contents
end
