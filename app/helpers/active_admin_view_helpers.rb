module ActiveAdminViewHelpers
  class << self
    def render_translated_name_sidebar(context)
      context.sidebar "Translated names", only: :show do
        div do
          semantic_form_for [:admin, TranslatedName.new] do |form|
            form.input(:resource_id, as: :hidden, input_html: {value: resource.id}) +
            form.input(:resource_type, value: 'Author', as: :hidden, input_html: {value: resource.class.to_s}) +
            form.inputs(:name, :language) +
            form.actions(:submit)
          end
        end

        table do
          thead do
            td :id
            td :language
            td :name
          end

          tbody do
            resource.translated_names.each do |translated_name|
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
  end
end
