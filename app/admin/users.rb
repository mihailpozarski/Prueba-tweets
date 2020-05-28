ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :authentication_token
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :authentication_token]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    selectable_column
    column :id
    column :email
    column :username
    column :created_at
    column :updated_at
    column 'Follow' do |u| u.friends.count end
    column 'Tweets' do |u| u.tweets.count end
    column 'Likes' do |u| Like.where(user: u).count end
    column 'Retweets' do |u| Retweet.where(user: u).count end
    actions
  end
end
