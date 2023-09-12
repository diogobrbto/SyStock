class Product < ApplicationRecord
    belongs_to :category
    has_one_attached :image
    
    validates :name, presence: true
    validates :description, presence: true
    validates :value, presence: true
    validates :quantities, presence: true
    validates :category_id, presence: true

    def image_url
        Rails.application.routes.url_helpers.rails_blob_path(self.image, only_path: true) if self.image.attached?
    end
end
