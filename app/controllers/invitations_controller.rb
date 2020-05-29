require 'httparty'
class InvitationsController < ApplicationController
	def new
	end
	
	def recordings
		# Directories for all recordings
	  @directories = Dir.entries(Rails.public_path).select{|f| !File.directory? f}.select{|i| i.include?("Zoom")}
	end

	def send_invitation
		zoom_client = Zoom.new
		# Create zoom meeting
		meeting = zoom_client.meeting_create(user_id: zoom_client.user_list["users"][0]["id"],start_time:DateTime.parse("#{params[:date]}T#{params[:time]}").in_time_zone("UTC"),timezone:"UTC", settings:{auto_recording:'local'})
		
		# Send meeting invite
		ZoomInvitationMailer.with(email:params[:email], date:params[:date], time:params[:time], meeting:meeting["join_url"]).invitation_mail.deliver

		#redirect back to root path
		redirect_to root_path
	end
end
