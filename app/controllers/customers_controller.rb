class CustomersController < ApplicationController
	before_action :set_customer, only: [:edit, :update, :show, :destroy]

	def index
		@customers = Customer.all
	end

	def new
		@customer = Customer.new
	end

	def create
		@customer = Customer.new(params_customer)

		if @customer.save
			redirect_to customers_path, notice: 'Cliente cadastrado com sucesso!'
		else
			render :new
		end	
	end

	def show
	end

	def edit
	end

	def update
		if @customer.update(params_customer)
			redirect_to customer_path(@customer.id), notice: 'Cliente Atualizado Com Sucesso'
		else
			render :edit
		end
	end

	def destroy
		if @customer.destroy
			redirect_to customers_path, notice: 'Cliente Excluido'
		else
			render :index
		end
	end

	private

	def set_customer
		@customer = Customer.find(params[:id])
	end

	def params_customer
		params.require(:customer).permit(:id, :name, :email, :smoker, :phone, :avatar)
	end
end
