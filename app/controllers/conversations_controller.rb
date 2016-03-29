class ConversationsController < ApplicationController
  helper_method :mailbox, :conversation

  def create
    recipient_emails = conversation_params(:recipients).split(',')

    recipient_emails.delete(current_user.email)

    @recipients = User.where(email: recipient_emails).all

    conversation = current_user.
      send_message(@recipients, *conversation_params(:body, :subject)).conversation

    redirect_to conversation_path(conversation)
  end

  def show
    @receipts = conversation.receipts_for(current_user).includes(message: [sender: [:profile]]).where('mailboxer_notifications.id > ?', params[:after_id].to_i)
  end

  def reply   
    @reciept = current_user.reply_to_conversation(conversation, *message_params(:body, :subject))
    @message = @reciept.message
    @id = conversation.id
    respond_to do |format|
      format.html { redirect_to conversation_path(conversation) }
      format.js
    end
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to :conversations
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to :conversations
  end

  def delete_from_trash
    conversation.mark_as_deleted current_user
    redirect_to :conversations
  end

  def chat
    @receipts = conversation.receipts_for(current_user).includes(message: [sender: [:profile]]).where('mailboxer_notifications.id > ?', params[:after_id].to_i)
  end

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def conversation_params(*keys)
    fetch_params(:conversation, *keys)
  end

  def message_params(*keys)
    fetch_params(:message, *keys)
  end

  def fetch_params(key, *subkeys)
    params[key].instance_eval do
      case subkeys.size
      when 0 then self
      when 1 then self[subkeys.first]
      else subkeys.map{|k| self[k] }
      end
    end
  end
end
