class FacebookEventIdValidationService
  def initialize(id)
    @url = "https://graph.facebook.com/v2.12/#{id}"
  end

  def perform
    uri = URI(@url)
    response = Net::HTTP.get(uri)
    response
  end
end
