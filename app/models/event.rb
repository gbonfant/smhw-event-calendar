class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_cannot_be_in_the_past

  private

  def end_date_cannot_be_in_the_past
    if (start_date.present? && end_date.present?) && end_date < start_date
      errors.add(:end_date, "can't be in the past")
    end
  end
end
