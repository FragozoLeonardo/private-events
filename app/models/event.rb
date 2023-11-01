# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendances
  has_many :users, through: :attendances

  validates :name, presence: true
  validates :date, presence: true
  validate :date_must_be_in_future_or_today

  def date_must_be_in_future_or_today
    return unless date.present? && date < Date.today

    errors.add(:date, "can't be in the past")
  end
end
