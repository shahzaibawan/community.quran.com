class AudioFile < QuranApiRecord
  belongs_to :resource, polymorphic: true
  belongs_to :recitation

  serialize :segments
end
