class ApplicationController < ActionController::Base

  #CSRF(クロスサイトリクエストフォージェリ)対策
  #"サイトに攻撃用のコードを仕込むことで、アクセスしたユーザーに対して意図しない操作を行わせる攻撃"を防げる
  protect_from_forgery with: :exception

  private
    def not_authenticated
      redirect_to login_path
      flash[:danger] = "ログインしてください。"
    end

    def reject_logged_in
      if logged_in?
        redirect_back(fallback_location: root_path)
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
