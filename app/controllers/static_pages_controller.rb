class StaticPagesController < ApplicationController
 
  def home
  	if signed_in?
  	  @micropost  = current_user.microposts.build
      @micropost.postimages.build 
  	  @feed_items = current_user.feed.paginate(page: params[:page])
    else
      @postimages = Postimage.find(:all, :limit => 5, :conditions => ["image != ?", "null"])
  	end
  end

  def help
  end

  def about

  end

  def contact
  end
end
