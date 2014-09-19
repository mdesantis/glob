class CommentsController < ApplicationController
  def create
    @page = Page.find_by_slug!(params[:page_slug])
    @page_comment = @page.comments.build(comment_params)

    respond_to do |format|
      if @page_comment.save
        format.html { redirect_to page_path(@page, anchor: "comment_#{@page_comment.id}"), notice: 'Comment was successfully created.' }
        format.js { render 'pages/create_page_comment' }
      else
        format.html { render 'pages/show' }
        format.js { render 'pages/create_page_comment' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :content)
  end
end