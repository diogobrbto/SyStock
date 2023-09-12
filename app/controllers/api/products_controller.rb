class Api::ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token 

    def index
        @products = Product.includes(:category).all
        render json: @products.to_json(include: :category, methods: :image_url)
    end

    def show
        @product = Product.includes(:category).find(params[:id])
        render json: @product.to_json(include: :category, methods: :image_url)
    end
end
