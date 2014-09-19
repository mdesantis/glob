class CommentsController < ApplicationController
  def create
    @page = Page.find_by_slug!(params[:page_slug])
    @page_comment = @page.comments.build(comment_params)

    if @page_comment.save
      redirect_to page_path(@page, anchor: "comment_#{@page_comment.id}"), notice: 'Comment was successfully created.'
    else
      render 'pages/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :content)
  end
end