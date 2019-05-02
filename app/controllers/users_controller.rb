class UsersController < ApplicationController
  def index
  end

  def show
    @the_user = User.find(params[:id])
  end

  def new
    @the_user = User.new
  end 

  def create
    @the_user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], city_id: City.last.id)
        if @the_user.save
          flash[:notice] = "Compte créé avec succès"
          log_in(@the_user)
          redirect_to "/"
        else 
            render "new"
        end

  end 




end
