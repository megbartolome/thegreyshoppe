class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to items_path
		else
			render :new
		end
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(item_params)
			redirect_to items_path
		else
			render :edit
		end
	end

	def destroy
		@item = Item.find(params[:id])
		if @item.destroy
			redirect_to items_path, notice: 'Successfull deleted'
		else
			redirect_to items_path, notice: @items.errors.full_messages.to_sentence
		end
	end

	private

	def item_params
		params.require(:item).permit(:name, :description, :quantity, :price)
	end

end