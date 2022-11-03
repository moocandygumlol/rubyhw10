class MainController < ApplicationController
  $id = -1
  def login
  end

  def create
    u = User.where(login: params[:login]).first
    if u and u.authenticate(params[:password])
      redirect_to main_user_item_path
      session[:user] = params[:login]
      session[:logged_in] = true
      session[:id] = u.id
      $id = u.id
      
    else
      redirect_to main_login_path, notice: 'your username or your password is wrong. please try again!'
    end
  end

  def destroy
    reset_session
  end

  def user_item
    session[:status] = 'user_item'
    session[:EditOrNew] = "edit"
    if !session[:logged_in]
      redirect_to main_login_path
    else
      @u = User.where(id: session[:id]).first
    end

  end

  def inventories
    if !session[:logged_in]
      redirect_to main_login_path
    end
    @u = session[:id]
    
  end

  def shop
    @u = User.where(id: params[:id]).first
  end

  def buy
    x = Item.where(id: params[:item_id]).first
    if(session[:id] == params[:user_id])
      redirect_to action: "shop", id: params[:user_id] , notice: 'you are the seller on this items'
    end
    if(x.stock > 0)
      x.stock -= 1
      x.save()
      u = Inventory.new
      u.user_id = session[:id]
      u.item_id = params[:item_id]
      u.price = params[:item_price]
      u.timestamp = DateTime.now
      u.save()
      redirect_to main_inventories_path
    else
      redirect_to action: "shop", id: params[:user_id] , notice: "out of stock"
      
    end
    
  end
end
