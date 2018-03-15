class PostsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def new
      @post = Post.new
    end

    def index
      @posts = Post.all
    end

    def show
      @post = Post.find(params[:id])
      if params[:value]
        @list1 = @post.lists.order({:upvotes => :desc},:downvotes).limit(params[:value])
      else
        @list1 = @post.lists.order({:upvotes => :desc},:downvotes).limit(3)
      end
      
      @comments = @post.comments.order("created_at DESC")

      respond_to do |format|
        format.html
        format.js
      end


    end

    def create
        @post = Post.new(post_params)
        @post.save
        redirect_to @post
      end
       
      private
        def post_params
          params.require(:post).permit(:post_id,:postText, :category)
        end
end
