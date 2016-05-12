ActiveAdmin.register Reward do
  permit_params :name, :points, :background_color, :font_color

  index do
    selectable_column
    id_column
    column :name do |reward|
      div class: "reward_default", style: "background: #{reward.background_color}; color: #{reward.font_color};" do
        reward.name
      end
    end
    column :points
    column :created_at
    column :updated_at
    actions
  end
end
