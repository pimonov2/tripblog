module Blog
	 class PostsController < BlogController

  # GET /posts
  # GET /posts.json
  

def index
  @posts = storage.list_for(params[:page], params[:tag])

end


  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = storage.friendly.find(params[:id])

  end


def search
@posts = Post.search(params[:search])
end

def category
  if params[:category].present?
     category = Category.find_by_name(params[:category])
     @posts = @posts.where(category_id: category)
  end
  
end
 

  private

  def storage
    Post.published
  end

	end

end