class Translation < QuranApiRecord
  belongs_to :resource, polymorphic: true
  belongs_to :language
  belongs_to :resource_content
  has_many :foot_notes, as: :resource
end
