class TagsController < ApplicationController
    include TagsHelper
    def index
        @tags = Tag.all
    end

    def show
        @tag = Tag.find(params[:id])
    end      

    def destroy
        @tag = Tag.find(params[:id])
        flash.notice = "Tag #{@tag.name} Deleted!"
        @tag.destroy
        redirect_to tags_path
    end

    def create
        @tag = Tag.create(tag_params)
        flash.notice = "Tag '#{@tag.name}' Created!"
        redirect_to tags_path
    end
      
    def edit
        @tag = Tag.find(params[:id])
    end
    
    def update
        @tag = Tag.find(params[:id])
        @tag.update(tag_params)
        flash.notice = "Tag '#{@tag.name}' Updated!"
        redirect_to tag_path(@tag)
    end
end
