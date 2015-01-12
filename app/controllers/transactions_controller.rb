class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

 def add_multiple
    unless params[:account_ids].present?
      respond_to do |format|
        format.html { redirect_to accounts_path, notice: 'Please choose an account to add the transaction to'}
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
     else
    @accounts = Account.find(params[:account_ids])
    @transactions = []
   @accounts.each do |account|
      @transaction = Transaction.new()
      account.transactions << @transaction
      @transactions.push(@transaction)
    end
  end
  end

  def update_multiple
    

    @transactions = Transaction.find(params[:transaction_ids])
    @transactions.reject! do |transaction|
      transaction.update_attributes(params[:transaction].reject { |k,v| v.blank? })
    end
    if @transactions.empty?
      redirect_to accounts_url
    else
      @transaction = Transaction.new(params[:transaction])
      render "add_multiple"
    end
  end

  def add
    @transaction = Transaction.new(amount: params[:amount_num])
    Account.find(params[:account_num]).transactions << @transaction
  end

  def add_with_description
    @transaction = Transaction.new(amount: params[:amount_num], name: params[:description])
    Account.find(params[:account_num]).transactions << @transaction

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to accounts_path, notice: 'Speeding ticket successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

   def add_other
    @transaction = Transaction.new()
    Account.find(params[:account_num]).transactions << @transaction
   end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        @message = @transaction.account.owner + "'s account has been updated"
        format.html { redirect_to accounts_path, notice: @message }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      if params[:id] == 'add_multiple'

      else
        @transaction = Transaction.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params[:transaction].permit(:name, :amount, :account_id, :account_ids)
    end
end
