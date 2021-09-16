class ClientMailer < ApplicationMailer

  def send_ticket_email

    # @client = params[:client]
    # @ticket = params[:ticket]
    # @order = params[:order]

    # @url  = ticket_url(@ticket.id)

    mail(to: '', subject: 'Your tixfix tickets')
  end
end
