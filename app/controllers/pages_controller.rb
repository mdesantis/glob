class PagesController < ApplicationController
  before_action :set_page,  only: [:show, :edit, :update, :destroy]
  before_action :set_pages, only: [:home, :index]

  def home
  end

  def index
    title_tag_breadcrumbs << 'Manage pages'
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
    title_tag_breadcrumbs << @page.title
  end

  def edit
    title_tag_breadcrumbs << @page.title << 'Edit'
  end

  def update
    if @page.update(page_params)
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_url, notice: 'Page was successfully destroyed.'
  end

  private

  def set_pages
    @pages = Page.all.order(id: :desc)
  end

  def set_page
    @page = Page.find_by_slug!(params[:slug])
  end

  def page_params
    params.require(:page).permit(:title, :slug, :content)
  end
end