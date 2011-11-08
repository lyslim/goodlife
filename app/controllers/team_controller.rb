class TeamController < ApplicationController
  def index
    @teammates = current_user.friends
    @user = User.new
    @page_title = "Your team"
  end

  def checkins
    @checkins = current_user.team_checkins
    @page_title = "Your team's check-ins"
  end

  def requests
    @outgoing_requests ||= []
    current_user.outgoing_member_requests.each do |request|
      @outgoing_requests << User.find(request.requestee_id)
    end
    @incoming_requests ||= []
    current_user.incoming_member_requests.each do |request|
      @incoming_requests << User.find(request.requestor_id)
    end
    @page_title = "Your requests"
  end

  def invite
    user = User.find(params[:id])
    current_user.request_membership(user)
    redirect_to :action => 'requests'
  end
end
