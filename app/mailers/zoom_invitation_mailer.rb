
  class ZoomInvitationMailer < ApplicationMailer
    def invitation_mail
      mail(
          to: params[:email],
          from: 'example@mail.com',
          subject: 'zoom invitation') do |format|
        format.html { render 'invitation_email' }
      end
    end
  end
