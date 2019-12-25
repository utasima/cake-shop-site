class DeliverInfosController < ApplicationController
  before_action :set_deliver_info, only: [:edit, :destroy, :update]

  def index
    @deliver_info = DeliverInfo.new
    @deliver_infos = DeliverInfo.all
  end

  def edit
  end

  def create
    @deliver_info = DeliverInfo.new(deliver_info_params)
    @deliver_info.customer_id = current_customer.id
    if @deliver_info.save
      redirect_to deliver_infos_path(@deliver_infos), notice: '住所を追加しました'
    else
      render action: :index
    end
  end

  def update
    if
      @deliver_info.update(deliver_info_params)
      redirect_to deliver_infos_path(@deliver_infos), notice: '更新しました。'
    else
      render action: :edit
    end
  end

  def destroy
    @deliver_info.destroy
    redirect_to deliver_infos_path
  end

  private
  def set_deliver_info
    @deliver_info = DeliverInfo.find(params[:id])
  end

  def deliver_info_params
    params.require(:deliver_info).permit(:address, :name, :postal_code)
  end
end
