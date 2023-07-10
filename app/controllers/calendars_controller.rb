class CalendarsController < ApplicationController
  # before_action: move_to_session, only:[:new, :edit]
  # before_action: move_to_index, only:[:show, :edit, :destroy]

  def index
  end

  private
  # def move_to_index
  #   unless current_user.id == @calendar.
  #     redirect_to "/"
  #   end
  # end

  # def move_to_session
  #   unless user_signed_in?
  #     redirect_to "/"
  #   end
  # end

end
