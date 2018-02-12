class CommentsController < ApplicationController

	def create
	    @post = Post.find(params[:post_id])
	    @comment = @post.comments.create(comment_params)
	    @comments = @post.comments.order("created_at DESC")
	    
      	respond_to do |format|
	        
	        format.js { render action: :create }
      	end
	end
	 
	private
	   def comment_params
	      params.require(:comment).permit(:commenter, :body, :post_id)
	   end
end
