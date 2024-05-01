class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_own_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchaseshippingaddress = PurchaseShippingAddress.new
  end
  
  def create
    @purchaseshippingaddress = PurchaseShippingAddress.new(purchase_params)
    if @purchaseshippingaddress.valid?
      pay_item
      @purchaseshippingaddress.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  def purchase_params
    params.require(:purchase_shipping_address).permit(:delivery_area_id, :zip_code, :city, :house_number, :building_name,:telephone_number).merge(user: current_user, item: @item, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price,  
    card: params[:token],  
    currency: 'jpy'                 
  )
end

private
    def set_item
      @item = Item.find(params[:item_id])
    end
  end

# def redirect_if_own_item
#   if current_user == @item.user || @item.purchase.nil? || @item.purchase.sold_out?
#     redirect_to root_path
#   end
# end

#     def redirect_if_own_item
#       if (current_user != @item.user) && (!@item.purchase.nil? && @item.purchase.sold_out?)
#         redirect_to root_path
#       end
#     end

#     def redirect_if_own_item
#       if (current_user != @item.user) && !@item.purchase.nil?
#         redirect_to root_path
#       end
#     end
  
def redirect_if_own_item
  if current_user == @item.user || @item.purchase.present?
    redirect_to root_path
  end
end


