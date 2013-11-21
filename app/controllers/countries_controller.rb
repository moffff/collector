class CountriesController < ApplicationController
  before_action :set_country, only: [:visited]

  def visited
    @country.visited_countries.create
    redirect_to :back
  end

  private
    def set_country
      @country = Country.find(params[:id])
    end

    def country_params
      params.require(:country).permit(:name, :code)
    end
end
