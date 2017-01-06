ActiveAdmin.register Word do
  menu parent: "Quran", priority: 3

  filter :verse_key
  filter :char_type
  filter :page_number

  index do
    column :id do |resource|
      link_to resource.id, admin_word_path(resource)
    end

    column :verse do |resource|
      link_to resource.verse_id, admin_verse_path(resource.verse_id)
    end

    column :verse_key
    column :char_type do |resource|
      resource.char_type.name
    end
    column :position
    column :text_madani
    column :text_simple
    column :text_clean
    actions
  end

  def scoped_collection
    super.includes :verse, :char_type # prevents N+1 queries to your database
  end

  sidebar "Audio", only: :show do
    table do
      thead do
        td :id
        td :language
        td :play
      end

      tbody do
        word.audio_files.each do |audio|
          tr do
            td link_to(audio.id, [:admin, audio])
          end
        end
      end
    end
  end

  sidebar "Transliterations", only: :show do
    table do
      thead do
        td :id
        td :language
        td :text
      end

      tbody do
        word.transliterations.each do |trans|
          tr do
            td link_to(trans.id, [:admin, trans])
            td link_to(trans.language_name, admin_language_path(trans.language_id)) if trans.language_id
            td trans.text
          end
        end
      end
    end
  end

  sidebar "Translations", only: :show do
    table do
      thead do
        td :id
        td :language
        td :text
      end

      tbody do
        word.translations.each do |trans|
          tr do
            td link_to(trans.id, [:admin, trans])
            td link_to(trans.language_name, admin_language_path(trans.language_id)) if trans.language_id
            td trans.text
          end
        end
      end
    end
  end
end
