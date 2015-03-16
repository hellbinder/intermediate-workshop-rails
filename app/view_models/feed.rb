class Feed
  def initialize(user_ids, scope = Shout)
    @user_ids = user_ids
    @scope = scope
  end

  def shouts
    scope.where(user_id: user_ids).includes(:content)
  end         

  # adding the functionality so it actually shows the feeds as a partial
  def to_partial_path
    "feeds/feed"
  end

  private
  attr_reader :user_ids, :scope
end