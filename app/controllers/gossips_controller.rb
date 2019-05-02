class GossipsController < ApplicationController
    before_action :authenticate_user, only: [:show, :new]
    before_action :currentuser_gossipauthor?, only: [:edit, :update, :destroy]

    def index
        @all_gossips = Gossip.all 
        @new_gossip_is_create = false
    end
    
    def show
        @the_gossip = Gossip.find(params[:id])
    end
    
    def new
        @gossip = Gossip.new
    end
    
    def create
        @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: current_user.id )
        @gossip.user = User.find_by(id: session[:user_id])
        if @gossip.save
            redirect_to "/"
            @new_gossip_is_create = true
        else 
            render "new"
        end
    end
    
    def edit
        @gossip = Gossip.find(params[:id])
    end
    
    def update
        @gossip = Gossip.find(params[:id])
        if @gossip.update(gossip_params)
          redirect_to "/"
        else
          render :edit
        end
    end

    def destroy
        @gossip = Gossip.find(params[:id])
        @gossip.destroy
        redirect_to "/"
    end

    private 

    def gossip_params
        gossip_params = params.require(:gossip).permit(:title, :content)
    end

    def currentuser_gossipauthor?
        unless current_user.id == @gossip.user.id
            flash[:danger] = "It's not your gossip"
            redirect_to gossips_path
        end
    end


end
