class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true

  validates :user_name, presence: true, unless: -> {user.present?}
  validates :user_email, presence: true, format: /\A[a-zA-z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless:-> {user.present?}

  validates :user, uniqueness: {scope: :event_id}, if: -> {user.present?}
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> {user.present?}
  validate :find_user
  validate :uniqueness_of_email, unless: -> {user.present?}

  def user_name
    user.present? ? user.name : super
  end

  def user_email
    user.present? ? user.email : super
  end

  private

  def find_user
    if self.user == self.event.user
      errors.add(:user, "Нельзя подписываться на свое событие")
    end
  end

  def uniqueness_of_email
    errors.add(:user_email, 'Данный email уже есть в базе, впишите другой, или зарегестируйтесь') if User.exists?(email: self.user_email)
  end
end
