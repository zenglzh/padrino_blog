PadrinoBlog::App.controllers :posts do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  post :create do
    @posts = Post.new(params[:post])
    @post.accout = current_account
    if @post.save
      flash[:notice] = 'Congratulations. Create a pice of blog successed'
      redirect url(:posts, :edit, :id => @post.id)
    else
      render 'posts/new'
    end
  end
  
  get :index do
      @posts = Post.all(:order =>'created_at desc')
      render 'posts/index'
  end

  get :show ,:with =>:id do
      @posts = Post.find_by_id(params[:id])
      render 'posts/show'
  end

end
