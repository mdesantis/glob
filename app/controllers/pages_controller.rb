class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update]
  
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
  end

  def edit
  end

  def update
    if @page.update(page_params)
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_page
    @page = Page.find_by_slug!(params[:slug])
  end

  def page_params
    params.require(:page).permit(:title, :slug, :content)
  end
end