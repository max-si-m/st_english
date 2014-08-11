class Words < ActiveRecord::Base
  validates :original, :translit, presence: true, length: {maximum: 40, minimum: 2}
end
