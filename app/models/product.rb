class Product < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :value, presence: true
    validates :quantities, presence: true
    
end
