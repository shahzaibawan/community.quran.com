ActiveAdmin.register Transliteration do
  menu parent: "Content"

  filter :language
  filter :resource_type, as: :select, collection: ['Verse', 'Word']
  filter :resource_id

  index do
    id_column

    column :language do |resource|
      link_to resource.language_name, admin_language_path(resource.language_id)
    end

    column :resource_type

    column :text

    actions
  end
end
