ActiveAdmin.register Language do
  menu parent: "Settings", priority: 1

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  sidebar "Translated names", only: :show do
    div do
      #TODO: add form here for adding new name
    end

    table do
      thead do
        td :id
        td :language
        td :name
      end

      tbody do
        language.translated_names.each do |translated_name|
         tr do
           td link_to(translated_name.id, [:admin, translated_name])
           td translated_name.language_name
           td translated_name.name
         end
        end
      end
    end
  end
end
