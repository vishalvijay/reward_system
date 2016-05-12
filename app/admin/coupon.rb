ActiveAdmin.register Coupon do
  belongs_to :user
  permit_params :code, :points, :expires_at, :reward_id, :user_id

  filter :code
  filter :points
  filter :expires_at
  filter :created_at
  filter :updated_at
  filter :reward_name
  filter :name_name

  form do |f|
    f.inputs do
      f.input :user_id, as: :hidden
      f.input :reward_id, as: :string
      f.input :code
      f.input :points
      f.input :expires_at
    end
    f.actions
  end
end
