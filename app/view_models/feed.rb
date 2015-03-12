class Feed
  include ActiveModel::Conversion

  def initialize(user_ids, scope = Shout)
    @user_ids = user_ids
    @scope = scope
  end

  def shouts
    scope.where(user_id: user_ids)
  end         

  def to_partial_path
    "feeds/feed"
  end

  private
  attr_accessor :user_ids, :scope
end