class DeliverInfosController < ApplicationController
  before_action :set_deliver_info, only: [:show, :edit, :update, :destroy,]

  def index
    @deliver_info = DeliverInfo.new
    @deliver_infos = DeliverInfo.find(current_customer.id)
  end
  
  def edit
    @deliver_info = DeliverInfo.new
  end

  def create
    @deliver_info = DeliverInfo.new(deliver_info_params)
    @deliver_info = @customer.deliver_infos.create(published_at: Time.now)#謎メソッドいらないなら消す
    if @deliver_info.save
      redirect_to deliver_infos_path(current_customer), notice: '住所を追加しました'
    else
      render action: :edit
    end
  end
  
  def update
    if 
      @deliver_info.update(deliver_info_params)
      redirect_to admin_item_path(@deliver_info), notice: '更新しました。'
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
