class AddressesController < ApplicationController

  def edit
    @address = current_user.address
  end

  def update
    @address = current_user.address
    @address.assign_attributes(address_update_params)
    if @address.save
	    redirect_to root_path, notice: 'プロフィールを更新しました'
    else
      render "address_edit"
    end
  end

  private

  def address_update_params
    params.require(:address).permit(:address,:postal_code, :prefecture_id, :city, :apartment)
  end

end
