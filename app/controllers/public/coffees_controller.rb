class Public::CoffeesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :ensure_matching_user, only: [:edit, :destroy]
  
  def new
    @coffee = Coffee.new
  end
  
  def create
    @coffee = Coffee.new
    @coffee.user_id = current_user.id
    if @coffee.save(coffee_params)
      redirect_to coffee_path, notice: I18n.t('flash.coffees.create')
    else
      render :new
    end
  end

  def index
    @coffees = Coffees.all
  end
  
  def show
    @coffee = Coffee.find(params[:id])
  end

  def edit
    @coffee = Coffee.find(params[:id])
    
  end
  
  def update
    @coffee = Coffee.find(params[:id])
    if @coffee.update(coffee_params)
      redirect_to coffee_path, notice: I18n.t('flash.coffees.update')
    else
      render :edit
    end
  end
  
  def destroy
    Coffee.find(params[:id]).destroy
    redirect_to coffees_path, notice: I18n.t('flash.coffees.destroy')
  end
  
  private
  
  def coffee_params
    params.require(:coffee).permit(:name, :shop, :introduction, :place, :total_rate, :flavor, :acidit_rate, :richness_rate, :bitterness_rate, :perfume)
  end
  
  def ensure_matching_user
    coffee = Coffee.find(params[:id])
    unless current_user == coffee.user
      redirect_to coffees_path, caution: I18n.t('flash.coffees.ensure')
    end
  end
end
