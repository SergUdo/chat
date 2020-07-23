class User < ApplicationRecord
  before_create :generate_nickname

  scope :online, -> { where(online: true) }

  def generate_nickname
    self.nickname = Faker::Name.first_name.downcase
  end
end
