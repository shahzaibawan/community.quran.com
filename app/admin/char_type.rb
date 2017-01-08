ActiveAdmin.register CharType do
  menu parent: "Settings", priority: 10

  permit_params do
    [:name, :parent_id, :description]
  end
end
