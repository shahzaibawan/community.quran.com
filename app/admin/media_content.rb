ActiveAdmin.register MediaContent do
  menu parent: "Media", priority: 2

  show do
    attributes_table do
      row :id
      row :resource
      row :language
      row :url

      row :embed_text do |resource|
       resource.embed_text.to_s.html_safe
      end
    end
  end
end
