class Public::PerfumeTagsController < ApplicationController
  def create
    perfume_tag = PerfumeTag.find_or_create_by!(perfume_tag_params)
    coffee = Coffee.find(params[:coffee_id])
    coffee.related_perfume_tags.find_or_create_by!(perfume_tag_id: perfume_tag.id)
    @perfume_tags = coffee.perfume_tags
  end
  
  def destroy
    coffee = Coffee.find(params[:coffee_id])
    perfume_tag = PerfumeTag.find(params[:id])
    coffee.related_perfume_tags.find_by(perfume_tag_id: perfume_tag.id).destroy
    @perfume_tags = coffee.perfume_tags
  end
  
  private
  
  def perfume_tag_params
    params.require(:perfume_tag).permit(:name)
  end
end
