class SessionsController < ApplicationController
  def new
  end

  def create
  	admin = Admin.find_by(name: params[:admin][:name])
  	password = params[:admin][:password]

  	if admin && admin.authenticate(password)
  		session[:admin_id] = admin.id
  		redirect_to admins_path, notice: "Вы успешно вошли как #{admin.name}."
  	else
  		redirect_to login_path, notice: "Неверное имя или пароль!"
  	end
  end

  def destroy
  	reset_session
  	redirect_to login_path, notice: "Вы вышли."
  end
end
