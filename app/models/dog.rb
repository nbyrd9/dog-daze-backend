class Dog < ApplicationRecord
    has_many :dog_actions, dependent: :destroy  
end
