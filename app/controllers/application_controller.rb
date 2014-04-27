class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :get_latestitem
  before_filter :get_latestpost
  before_filter :get_totalcost
  before_filter :get_age

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def get_latestitem
 	  @latestitem = Item.all.order("created_at DESC").limit(1)
  end

  def get_latestpost
 	  @latestpost = Post.all.order("created_at DESC").limit(1)
  end

  def get_totalcost
    @items = Item.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @total_cost = Item.price_total.last
  end

  def get_age
    @age = Time.diff(Time.now,'1983-07-02', '%y, %M')
  end

end
