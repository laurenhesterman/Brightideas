class PostsController < ApplicationController
    def create
        
        @thispost = current_user.posts.new(post_params)
        if @thispost.save
            #@thisplaylist = Playlist.create(song_id: @thissong.id, user_id: current_user.id)
            redirect_to "/ideas"
        else
            flash[:errors] = @thispost.errors.full_messages
            redirect_to "/ideas"
        end
    end
   # def show
        #@thissong = Song.find(params[:id])
        #@songs = Playlist.find_by_song_id(params[:id])  
    #end
    def destroy
        @delpost = Post.find(params[:id])
        @delpost.destroy
        redirect_to "/ideas"
    end
    private
    def post_params
        params.require(:post).permit(:content)
    end
    
end
