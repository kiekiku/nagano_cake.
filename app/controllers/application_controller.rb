class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # strong parameterで姓と名の属性(firstNameとlastName)をpermitする
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName])
  end
  def after_sign_in_path_for(resource)
   case resource
  			when Admin
    			admin_root_path
			  when Customer
				  items_path
   end
  end
end

