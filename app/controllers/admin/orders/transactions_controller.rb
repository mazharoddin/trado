class Admin::Orders::TransactionsController < ApplicationController

  before_filter :authenticate_user!
  layout 'admin'

  def edit
    @transaction = Transaction.find(params[:id])
    render :partial => 'admin/orders/transactions/edit', :format => [:js]
  end

  def update
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        format.js { render :partial => 'admin/orders/transactions/success', :format => [:js] }
      else 
        format.json { render :json => { :errors => @transaction.errors.full_messages}, :status => 422 } 
      end
    end
  end

end