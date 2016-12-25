require "./spec_helper"

describe Crystal::Intern::Exercise do
  it "LTSVファイルが正しくパースされていること" do
    logs = LtsvParser.parse("./sample_data/log.ltsv")

    logs.size.should eq(5)

    logs[0].method.should eq("GET")
    logs[0].path.should eq("/apache_pb.gif")
    logs[0].protocol.should eq("HTTP/1.0")
    logs[0].uri.should eq("http://127.0.0.1/apache_pb.gif")
    logs[0].time.should eq("2013-07-01T15:59:50")

    logs[4].method.should eq("GET")
    logs[4].path.should eq("/notfound.gif")
    logs[4].protocol.should eq("HTTP/1.0")
    logs[4].uri.should eq("http://127.0.0.1/notfound.gif")
    logs[4].time.should eq("2013-07-02T19:46:35")
  end

  it ("LTSVファイルが正しくパースできない形式の場合") do
    expect_raises LtsvParseException do
      LtsvParser.parse("./sample_data/log_invalid.ltsv")
    end
  end
  
  it ("LTSVファイルが存在しない場合") do
    expect_raises FileNotFoundException do
      LtsvParser.parse("")
    end
  end
end
