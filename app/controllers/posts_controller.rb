class PostsController < ApplicationController
    
    before_action :set_post, only: [:show, :edit, :update, :destroy]
   
    def index
        @post = Post.all 
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.create(post_params)
    end 
    
    def show
        @post = Post.find(params[:id])
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to(post_path(@post))
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end
    
    private

    def post_params
      params.require(:post).permit(:image, :caption)
    end
    
    def set_post
        @post = Post.find(params[:id])
    end
end
