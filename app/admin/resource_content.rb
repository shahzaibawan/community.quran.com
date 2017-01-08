ActiveAdmin.register ResourceContent do
  menu parent: "Content", priority: 10

  filter :cardinality_type
  filter :approved
  filter :language
  filter :resource_type
  filter :sub_type

  index do
    column :id do |resource|
      link_to(resource.id, [:admin, resource])
    end

    column :author do |resource|
      link_to resource.author_name, admin_author_path(resource.author_id) if resource.author_id
    end

    column :language do |resource|
      link_to resource.language_name, admin_language_path(resource.language_id) if resource.language_id
    end

    column :name
    column :approved
    column :cardinality_type
    column :sub_type
    actions
  end
end
