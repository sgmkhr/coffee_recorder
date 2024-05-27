class Public::FlavorTagsController < ApplicationController
  def create
    flavor_tag = FlavorTag.find_or_create_by!(flavor_tag_params)
    coffee = Coffee.find(params[:coffee_id])
    coffee.related_flavor_tags.find_or_create_by!(flavor_tag_id: flavor_tag.id)
    @flavor_tags = coffee.flavor_tags
  end
  
  def destroy
    coffee = Coffee.find(params[:coffee_id])
    flavor_tag = FlavorTag.find(params[:id])
    coffee.related_flavor_tags.find_by(flavor_tag_id: flavor_tag.id).destroy
    @flavor_tags = coffee.flavor_tags
  end

  private
  
  def flavor_tag_params
    params.require(:flavor_tag).permit(:name)
  end
end
