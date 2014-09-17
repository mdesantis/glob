class PagesController < ApplicationController
  def home
  end

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to @page, notice: 'Page was successfully created.'
    else
      render :new
    end
  end

  def show
    @page = Page.find_by_slug!(params[:slug])
  end

  def edit
  end

  private

  def page_params
    params.require(:page).permit(:title, :slug, :content)
  end
end