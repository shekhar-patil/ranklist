class PostsController < ApplicationController
    def new
    end
    def index
        @posts = Post.all
      end

    def show
      @post = Post.find(params[:id])
      if params[:value]
        @list1 = @post.lists.order({:upvotes => :desc},:downvotes).limit(params[:value])
      else
        @list1 = @post.lists.order({:upvotes => :desc},:downvotes).limit(5)
      end
      
      @comments = @post.comments.order("created_at DESC")

      respond_to do |format|
        format.html
        format.js
      end


    end


    #def show
     #   @post = Post.find(params[:id])
      #  @list1 = @post.lists.order({:upvotes => :desc},:downvotes)
       # 
      #end
    def create
        @post = Post.new(post_params)
       
        @post.save
        redirect_to @post
      end
       
      private
        def post_params
          params.require(:post).permit(:postText, :category)
        end
end
