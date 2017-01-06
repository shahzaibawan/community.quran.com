class Recitation < QuranApiRecord
  belongs_to :reciter
  belongs_to :resource_content
  belongs_to :recitation_style
end
