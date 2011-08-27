class RewardsController < ApplicationController
  layout 'main'

  def index
    @tag = RewardCategory.find(params[:tag_id]) if params[:tag_id]
    if params[:search].blank?
      @rewards = @tag ? @tag.rewards : Reward.all
    else
    #  @episodes = Episode.search_published(params[:search], params[:tag_id])
    end
    respond_to do |format|
      format.html
      format.rss
    end
  end

  def show
  end

end