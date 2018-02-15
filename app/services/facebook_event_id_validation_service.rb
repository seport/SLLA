class FacebookEventIdValidationService
  def initialize(url)
    @url = url
  end

  def perform
    uri = URI(@url)
    response = Net::HTTP.get(uri)
    response
  end
end
