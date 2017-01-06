ActiveAdmin.register Recitation do
  menu parent: "Settings", priority: 1

  permit_params do
    [:reciter_id, :recitation_style_id, :resource_content_id]
  end
end
