class ApplicationController < ActionController::Base

  #CSRF(クロスサイトリクエストフォージェリ)対策
  #"サイトに攻撃用のコードを仕込むことで、アクセスしたユーザーに対して意図しない操作を行わせる攻撃"を防げる
  protect_from_forgery with: :exception

  private
    def not_authenticated
      redirect_to login_path, alert: "ログインしてください。"
    end
end
