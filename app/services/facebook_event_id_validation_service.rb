class FacebookEventIdValidationService
  def initialize(url)
    @url = url
  end

  def perform
    yield if block_given?
  end
end
