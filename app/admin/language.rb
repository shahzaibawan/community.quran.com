ActiveAdmin.register Language do
  menu parent: "Settings", priority: 1
  ActiveAdminViewHelpers.render_translated_name_sidebar(self)

  permit_params do
    [:name, :iso_code, :native_name, :direction, :es_analyzer_default]
  end
end
