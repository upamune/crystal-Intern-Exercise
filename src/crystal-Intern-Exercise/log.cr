  class Log
  @splited_req : Array(String)
  getter :host, :user, :epoch, :req, :status, :size, :referer

  def initialize(@host : String, @user : (String | Nil), @epoch : Int32, @req : String, @status : Int32, @size : Int32, @referer : (String | Nil))
    @splited_req = @req.split(" ")
  end

  def method : String
    @splited_req[0]
  end

  def path : String
    @splited_req[1]
  end

  def protocol : String
    @splited_req[2]
  end

  def time : String
    Time.epoch(@epoch).to_s("%Y-%m-%dT%H:%M:%S")
  end

  def uri : String
    "http://#{@host}#{path}"
  end
end
