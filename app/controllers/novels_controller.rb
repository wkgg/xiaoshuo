class NovelsController < ApplicationController

  # def index
  # end

  # def new
  #   @novel = Novel.new
  # end

  # def create
  #   @novel = Novel.new(novel_params)
  #   if @novel.save
  #     redirect_to @novel, notice: "successful"
  #   else
  #     render action: 'new'
  #   end
  # end

  def show
    if params[:name]
      name = params[:name] 
      if !Novel.find_by_name(name)
         get_xiaoshuo_link(name)
      end
      @novel = Novel.find_by_name(name)    
    elsif params[:id]
      @novel = Novel.find(params[:id])
    else
    end
  end

  def get_xiaoshuo_link name
    link = "http://tieba.baidu.com/f/good?kw=" + name
    @novel = Novel.create(name:name, link:link)
    @novel.get_chapters
  end

  private

  def novel_params
    params.require(:novel).permit(:name, :link)
  end

end
