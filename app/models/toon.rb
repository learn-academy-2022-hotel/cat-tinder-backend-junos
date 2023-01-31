class Toon < ApplicationRecord
    validates :name, :age, :enjoys_doing, :image, presence: true
    validates :enjoys_doing, length: {minimum: 10}
end
