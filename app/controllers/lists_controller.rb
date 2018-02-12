class ListsController < ApplicationController

    def create

        @post = Post.find(params[:post_id])
        @list = @post.lists.create(list_params)
        redirect_to post_path(@post)
      end
      def show

        @post = Post.find(params[:post_id])
        @list = @post.lists.find(params[:id])
      end
      def upvote
        @post = Post.find(params[:post_id])
        @list = @post.lists.find(params[:list_id])

        protip = String(@post.id) + "_up_" +String(@list.id) 
        
        if !browser.bot? && browser.known?
          recently_viewed = cookies[:viewd_protips].to_s.split(':')
          if !recently_viewed.include?(protip)
            k = @list.upvotes
            @list.upvotes = k+1
            @list.save
            recently_viewed << protip
          end
          cookies.permanent[:viewd_protips] = {
            value:    recently_viewed.join(':')
          }
        end

        respond_to do |format|
          format.html {redirect_to @post}
          format.js 
        end
      end


      def downvote
        @post = Post.find(params[:post_id])

        @list = @post.lists.find(params[:list_id])
        
        protip = String(@post.id) + "_down_" +String(@list.id) 
        
        if !browser.bot? && browser.known?
          recently_viewed = cookies[:viewd_downvotes].to_s.split(':')
          if !recently_viewed.include?(protip)
            k = @list.downvotes
            @list.downvotes = k+1
            @list.save
            recently_viewed << protip
          end
          cookies.permanent[:viewd_downvotes] = {
            value:    recently_viewed.join(':')
          }
        end

        respond_to do |format|
          format.html {redirect_to @post}
          format.js 
        end
      end
     
      private
        def list_params
          params.require(:list).permit(:name, :aboutText, :photolink, :link)
        end
end
