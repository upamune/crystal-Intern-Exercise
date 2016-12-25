  class Log
  getter :host, :user, :epoch, :req, :status, :size, :referer

  def initialize(@host : String, @user : (String | Nil), @epoch : Int32, @req : String, @status : Int32, @size : Int32, @referer : (String | Nil))
  end

  def method : String
    @req.split(" ")[0]
  end

  def path : String
    @req.split(" ")[1]
  end

  def protocol : String
    @req.split(" ")[2]
  end

  def time : String
    Time.epoch(@epoch).to_s("%Y-%m-%dT%H:%M:%S")
  end

  def uri : String
    "http://#{@host}#{path}"
  end
end
