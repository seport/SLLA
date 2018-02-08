class GetFbEventObjectFromFbIdService
  def initialize(params)
    @fb_id = params[:fb_id]
  end

  def fetch
    @fb_id
  end
end