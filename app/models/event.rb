class Event < ApplicationRecord
<<<<<<< HEAD
    before_save :parse_fb_id
    validates_format_of :fb_id, :with => /facebook.com\/events\/[1234567890]{15}[\/]?/i, :on => :create
    def parse_fb_id
      self.fb_id=/[1234567890]{15}/.match(self.fb_id).to_s
    end
=======
  before_save :parse_fb_id
  validates :fb_id,
            format: { with: /facebook.com\/events\/[1234567890]{15}[\/]?/i, },
            presence: true,
            uniqueness: true,
            on: :create

  def parse_fb_id
    self.fb_id=/[1234567890]{15}/.match(self.fb_id).to_s
  end
>>>>>>> Add valdation for presence and uniqueness to Event model.
end
