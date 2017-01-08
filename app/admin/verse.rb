ActiveAdmin.register Verse do
  menu parent: "Quran", priority: 2

  actions :all, except: [:destroy, :new]

  filter :chapter_id
  filter :verse_number
  filter :verse_index
  filter :verse_key
  filter :juz_number
  filter :hizb_number
  filter :rub_number
  filter :sajdah
  filter :page_number
  filter :sajdah_number, as: :select, collection: proc { 1..14 }

  index do
    column :verse_number do |verse|
      link_to verse.id, admin_verse_path(verse)
    end
    column :chapter do |verse|
      link_to verse.chapter.id, admin_chapter_path(verse.chapter)
    end
    column :verse_number
    column :verse_key
    column :juz_number
    column :hizb_number
    column :sajdah_number
    column :page_number
    column :text_madani
  end

  show do
    attributes_table do
      row :id
      row :chapter do |object|
        link_to object.chapter_id, admin_chapter_path(object.chapter)
      end
      row :verse_number
      row :verse_index
      row :verse_key
      row :juz_number
      row :hizb_number
      row :rub_number
      row :page_number
      row :sajdah_number
      row :sajdah
      row :text_madani
      row :text_simple
      row :text_indopak
    end

    panel "Available Recitations" do
      table do
        thead do
          td "ID"
          td "Reciter"
          td "Recitation style"
          td "Duration"
          td "Audio"
        end

        tbody do
          verse.audio_files.includes(:recitation).each do |file|
            tr do
              td link_to(file.id, admin_audio_file_path(file))
              td file.recitation.reciter_name
              td file.recitation.style
              td file.duration
              td do
                 (link_to("play", "#_", class: 'play')+
                 audio_tag("", data:{url: file.url},controls: true, class: 'audio') )if file.url
                  end
            end
          end
        end
      end
    end

    panel "Translations", class: 'scrollable' do
      table do
        thead do
          td "ID"
          td "Language"
          td "Text"
        end

        tbody do
          verse.translations.each do |trans|
            tr do
              td link_to(trans.id, admin_translation_path(trans))
              td trans.language_name
              td do
                div class: trans.language_name.to_s.downcase do
                  (trans.text)
                  end
              end
            end
          end
        end
      end
    end
  end

  sidebar "Media content", only: :show do
   table do
     thead do
       td :id
       td :language
       td :author
       td :language
     end

     tbody do
       resource.media_contents.each do |c|
         tr do
           td link_to(c.id, [:admin, c])
           td c.language_name
           td c.resource_content.author_name
         end
       end
     end
   end
  end

  sidebar "Tafsirs", only: :show do

  end

  def scoped_collection
    super.includes :chapter, :translations, :audio_files # prevents N+1 queries to your database
  end
end
