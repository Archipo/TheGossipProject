class CommentsController < ApplicationController
    before_action :authenticate_user, only: [:new]


    def create
        @comment = Comment.new(content: params[:content], user_id: current_user.id, gossip_id: params[:id])
        if @comment.save
            redirect_to gossip_path(params[:id])
        else 
            render "new"
        end
    end 

    def edit
        @comment = Comment.find(params[:id])
    end 

    def update
        @comment = Comment.find(params[:id])
        @gcomment.user = User.find_by(id: session[:user_id])
        if @comment.update(comment_params)
            redirect_to "/"
        else
            render :edit
        end
    end 
    
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to "/"
    end

    private 

    def comment_params
        comment_params = params.require(:comment).permit(:content)
    end 

end
