ActiveAdmin.register TranslatedName do
  menu parent: "Settings"
  actions :all, except: :new

  permit_params do
    [:resource_type, :resource_id, :name, :language_id]
  end

  form do |f|
    f.inputs do
    f.input :resource_id, as: :hidden
    f.input :resource_type, as: :hidden
    f.input :name, required: true
    f.input :language, required: true
    end
    f.actions
  end
end

