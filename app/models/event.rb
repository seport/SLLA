class Event < ApplicationRecord
  validates :fb_id,
            format: { with: /facebook.com\/events\/\d+[\/]?/i, message: 'Please supply a facebook id with 15 characters.'},
            presence: { message: 'Please supply a facebook id number.' },
            uniqueness: { message: 'That facebook event has already been registed.' },
            on: :create
  validate :validate_facebook_event

  def parse_fb_id
    self.fb_id = /\d+/.match(self.fb_id).to_s
  end

  def validate_facebook_event
    valid_event = FacebookEventIdValidationService.new(self.fb_id).perform
    errors.add(:fb_id, "This facebook event isn't available.") unless valid_event 
    nil
  end 
end
