class AccountsController < ApplicationController
	 def index
	 	@accounts= Account.all
	 	@balance=Account.balance
		@debt=Account.debt
	 	@total=Account.total
 	end
 	
 	def create
		@accounts= Account.create(account_params)
		if @accounts.valid?
			flash[:success] = "Your account record has been posted!"
			redirect_to root_path
	 	else
			flash[:alert] = "Sorry! there has been an error!"
		end
 	end
 	
 	def new
 		@account=Account.new
 	end
 	def edit
		 @accounts = Account.find(params[:id])
	end
	def update
		@accounts = Account.find(params[:id])
			if @accounts.update(account_params)
				flash[:success] = "The  account record has been updated!"
				redirect_to root_path
			else
				flash[:alert] = "Sorry! there has been an error!"
				redirect_to edit_account_path(params[:id])
    		end
	end
	def destroy
		@accounts=Account.find(params[:id])
		@accounts.destroy
		flash[:success] = "The Account record was successfully deleted!"
		redirect_to root_path
	end
	
	private
	def account_params
		params.require(:account).permit(:title, :date , :amount)
	end
end
