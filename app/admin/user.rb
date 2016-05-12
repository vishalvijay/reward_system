ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name, :image_url

  sidebar "Options", only: [:show, :edit] do
    ul do
      li link_to "Reward point transactions", admin_user_reward_point_transactions_path(user)
    end
  end

  index do
    selectable_column
    id_column
    column "DP" do |m|
      image_tag(m.image_url, width: 70)
    end
    column :name
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row "DP" do |m|
        image_tag(m.image_url)
      end
      row :points
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  filter :name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :image_url
    end
    f.actions
  end

end
