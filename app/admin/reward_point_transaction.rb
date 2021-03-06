ActiveAdmin.register RewardPointTransaction do
  belongs_to :user
  permit_params :title, :points, :user_id, :coupon_id

  filter :title
  filter :points
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :user_id, as: :hidden
      f.input :title
      f.input :points
      f.input :coupon_id
    end
    f.actions
  end

end
