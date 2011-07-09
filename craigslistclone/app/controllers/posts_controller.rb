class PostsController < ApplicationController
  before_filter :set_category
  before_filter :authenticate_user!, only: [:create, :edit, :new]
  # GET /posts
  # GET /posts.json
  def index
    
    if @category
      @posts = @category.posts
    elsif params[:group_id]
      @posts = Post.where(:category_id => Category.where(:group => params[:group_id]).collect(&:id))
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    
    @post = Post.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @category.posts.build(params[:post])
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to [@category, @post], notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to [@category, @post], notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to category_posts_url(@category) }
      format.json { head :ok }
    end
  end
  
  private
  
  def set_category
    @category = Category.find(params[:category_id]) if params[:category_id]
  end
end
