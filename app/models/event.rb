class Event < ApplicationRecord
  before_validation :format_fb_id
  validates :fb_id,
            format: { with: /\d+/i, message: 'Facebook id must contain only digits.'},
            presence: { message: 'Please supply a facebook id number.' },
            uniqueness: { message: 'That facebook event has already been registed.' },
            on: :create
  validate :validate_facebook_event

  def validate_facebook_event
    return if !errors.empty?
    valid_event = FacebookEventIdValidationService.new(self.fb_id).perform
    errors.add(:fb_id, "This facebook event isn't available.") unless valid_event 
    nil
  end

  private

  def format_fb_id
    match = /facebook.com\/events\/(?<fb_id>\d+)/.match(self.fb_id)
    if match.present? then
      self.fb_id = match[:fb_id]
    else
      errors.add(:fb_id, "Please submit a facebook link.") unless match.present?
    end
  end
end
