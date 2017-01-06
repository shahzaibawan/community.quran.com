ActiveAdmin.register AudioFile do
  menu parent: "Media", priority: 1

  permit_params do
    [:resource_type, :resource_id, :url, :duration, :segments, :recitation_id]
  end
end
