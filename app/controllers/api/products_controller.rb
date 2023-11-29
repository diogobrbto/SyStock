class Api::ProductsController < ApplicationController
    before_action :authenticate

    def index
        @products = Product.includes(:category).all
        render json: @products.to_json(include: :category, methods: :image_url)
    end

    def show
        @product = Product.includes(:category).find(params[:id])
        render json: @product.to_json(include: :category, methods: :image_url)
    end

    private

    def authenticate
        authenticate_token || render_unauthorized
    end

    def authenticate_token
        authenticate_with_http_token do |token, options|
        User.find_by(token: token)
        end
    end

    def render_unauthorized
        self.headers['WWW-Authenticate'] = 'Token realm="Application"'
        render json: 'Bad credentials', status: 401
    end 
end
