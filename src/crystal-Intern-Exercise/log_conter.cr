class LogCounter
  GUEST_USER = "guestUser"

  def initialize(@logs : Array(Log))
  end

  def count_error
    @logs.map{ |log| log.status }.select{ |status| (500..599).includes? status }.size
  end

  def group_by_user
    @logs.group_by { |log|
      case log.user
      when String
        log.user
      when Nil
        GUEST_USER
      end
    }
  end

  def group_by_path
    @logs.group_by { |log| log.path }
  end

  def group_by_date
    @logs.group_by { |log| log.time.split("T")[0] }
  end
end
