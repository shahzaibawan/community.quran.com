class ResourceContent < QuranApiRecord
  belongs_to :author
  belongs_to :language
  belongs_to :data_source
end
