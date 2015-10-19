class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  def self.recent
    self.where("created_at between (Now() - interval '5 days') AND Now()")
  end

  def self.recent_convo_ids
    self.recent.order(created_at: :DESC).map{|mess| mess.conversation_id}.uniq
  end

end
