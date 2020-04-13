class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    end
    #アカウント登録後のリダイレクト先
    def after_sign_up_path_for(resource)
        user_path(resource)
    end
    #アカウント編集後のリダイレクト先
    def after_update_path_for(resource)
        user_path(resource)
    end
    #ログイン後のリダイレクト先
    def after_sign_in_path_for(resource)
        user_path(resource)
    end
    #ログアウト後のリダイレクト先
    def after_sign_out_path_for(resource)
        root_path
    end
    private
end