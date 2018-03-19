class Event < ApplicationRecord
  validates :fb_url,
            format: { with: /facebook.com\/events\/\d+[\/]?/i, message: 'Please supply a facebook id with 15 characters.'},
            presence: { message: 'Please supply a facebook id number.' },
            uniqueness: { message: 'That facebook event has already been registed.' },
            on: :create
  validate :validate_facebook_event

  def validate_facebook_event
    return if !errors.empty?
    valid_event = FacebookEventIdValidationService.new(fb_id).perform
    errors.add(:fb_url, "This facebook event isn't available.") unless valid_event 
    nil
  end

  private

  def fb_id
    match = /facebook.com\/events\/(?<fb_id>\d+)/.match(self.fb_url)
    match[:fb_id]
  end
end
