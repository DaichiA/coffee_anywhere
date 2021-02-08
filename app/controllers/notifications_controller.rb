class NotificationsController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
    @notifications = current_user.passive_notifications.includes(:visitor, :visited, {review: [:shop, :user]}).paginate(page: params[:page], per_page: 10)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end
