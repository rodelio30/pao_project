class Client < ApplicationRecord
  belongs_to :user

  validates :cp_number, presence: true,
                        numericality: true,
                        length: { :minimum => 10, :maximum => 15 }
end
