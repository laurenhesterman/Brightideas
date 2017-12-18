class UsersController < ApplicationController
  def index
  end
  def create
    @thisuser = User.new(user_params)
    if @thisuser.save
        session[:user_id] = @thisuser.id
        redirect_to "/ideas"
    else
        flash[:errors] = @thisuser.errors.full_messages
        redirect_to ('/')
    end
end
def ideas
  @theseposts = Post.joins(:likes).group("posts.id").order("count(likes.id) desc")
  
  @nolikes = Post.includes(:likes).where( :likes => { :post_id => nil } )
  
end
def show
  @thisuser = User.find(params[:id])
end
def list
  @thispost = Post.find(params[:id])
  @theselikers = Like.where("post_id = ?", params[:id]).select(:user_id).distinct
  @theselikers.distinct
  
end
private
def user_params
    params.require(:user).permit(:name, :alias, :email, :password)
end
end
