class FacebookEventIdValidationService
  def initialize(id)
    @url = "https://graph.facebook.com/v2.12/#{id}"
  end

  def perform
    uri = URI(@url)
    json_response = Net::HTTP.get(uri)
    response = JSON.parse(json_response)
    return true if response.key?("name")
    return false if response.key?("error")
  end
end