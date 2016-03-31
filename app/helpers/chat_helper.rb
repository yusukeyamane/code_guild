module ChatHelper
  def button_should_appeared?
    if current_user.id == @contract.host_user_id && @contract.situation == "will_do"
      true
    else
      false
    end
  end
end
