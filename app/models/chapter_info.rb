class ChapterInfo < QuranApiRecord
  belongs_to :chapter
  belongs_to :language
  belongs_to :resource_content
end
