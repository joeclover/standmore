require_relative 'text_notifier'

class Desk
  def initialize(notifier, current_state = 'sitting')
    @notifier = notifier
    @current_state = current_state
  end

  def stand
    unless @current_state == 'standing'
      notify("Time to stand up!")
      @current_state = 'standing'
    end
  end

  def sit
    unless @current_state == 'sitting'
      notify("Time to sit down!")
      @current_state = 'sitting'
    end
  end

  def change_state
    if @current_state == 'standing'
      sit
    else
      stand
    end
  end

  def notify(message)
    @notifier.send(message)
  end
end
