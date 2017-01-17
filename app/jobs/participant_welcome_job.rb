class ParticipantWelcomeJob < ApplicationJob
  queue_as :default

  def perform(participant)
    ParticipantJoinMailer.join_email(participant).deliver_now
  end
end
