class PropertiesController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @pagy, @properties = pagy(Property.all.order(created_at: :desc))
  end

  def show
    # Obtener el valor del dólar y convertir precios
    response = HTTParty.get("https://mindicador.cl/api")
    if response.success?
      exchange_rate = response.parsed_response["dolar"]["valor"].to_f
      @converted_price = @property.currency == "CLP" ? (@property.price / exchange_rate).round(2) : (@property.price * exchange_rate).round(2)
    end
  end

  def new
    @property = current_user.properties.new
  end

  def create
    @property = current_user.properties.new(property_params)
    if @property.save
      redirect_to @property, notice: 'Propiedad creada exitosamente.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @property.update(property_params)
      redirect_to @property, notice: 'Propiedad actualizada exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to root_path, notice: 'Propiedad eliminada exitosamente.'
  end

  def search
    # Implementar lógica de búsqueda
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: 'No autorizado.' unless @property.user == current_user
  end

  def property_params
    params.require(:property).permit(:type, :price, :currency, :comuna, :address, :area, :bedrooms, :bathrooms, :latitude, :longitude, :description, photos: [])
  end
end
