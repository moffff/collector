class CurrenciesController < ApplicationController
  before_action :set_currency, only: [:show]

  def index
    @currencies = Currency.all
  end

  def show
  end

  private
    def set_currency
      @currency = Currency.find(params[:id])
    end

    def currency_params
      params.require(:currency).permit(:code, :name)
    end
end
