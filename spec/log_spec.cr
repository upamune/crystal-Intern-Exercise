require "./spec_helper"

describe Crystal::Intern::Exercise do
  it "Logクラスのメソッドが正しく実装されている" do
    log = Log.new(
      host: "127.0.0.1",
      user: "frank",
      epoch: 1372694390,
      req: "GET /apache_pb.gif HTTP/1.0",
      status: 200,
      size: 2326,
      referer: "http://www.hatena.ne.jp/"
    )

    log.host.should eq("127.0.0.1")
    log.user.should eq("frank")
    log.epoch.should eq(1372694390)
    log.req.should eq("GET /apache_pb.gif HTTP/1.0")
    log.status.should eq(200)
    log.size.should eq(2326)
    log.referer.should eq("http://www.hatena.ne.jp/")
    log.method.should eq("GET")
    log.path.should eq("/apache_pb.gif")
    log.protocol.should eq("HTTP/1.0")
    log.uri.should eq("http://127.0.0.1/apache_pb.gif")
    log.time.should eq("2013-07-01T15:59:50")
  end

  it "Logクラスはuserが-の場合はNoneにする" do
    log = Log.new(
      host: "127.0.0.1",
      user: nil,
      epoch: 1372694390,
      req: "GET /apache_pb.gif HTTP/1.0",
      status: 200,
      size: 2326,
      referer: "http://www.hatena.ne.jp/"
    )

    log.host.should eq("127.0.0.1")
    log.user.should eq(nil)
    log.epoch.should eq(1372694390)
    log.req.should eq("GET /apache_pb.gif HTTP/1.0")
    log.status.should eq(200)
    log.size.should eq(2326)
    log.referer.should eq("http://www.hatena.ne.jp/")
    log.method.should eq("GET")
    log.path.should eq("/apache_pb.gif")
    log.protocol.should eq("HTTP/1.0")
    log.uri.should eq("http://127.0.0.1/apache_pb.gif")
    log.time.should eq("2013-07-01T15:59:50")
  end

  it "Logクラスはrefererが-の場合はNoneにする" do
    log = Log.new(
      host: "127.0.0.1",
      user: "frank",
      epoch: 1372694390,
      req: "GET /apache_pb.gif HTTP/1.0",
      status: 200,
      size: 2326,
      referer: nil
    )

    log.host.should eq("127.0.0.1")
    log.user.should eq("frank")
    log.epoch.should eq(1372694390)
    log.req.should eq("GET /apache_pb.gif HTTP/1.0")
    log.status.should eq(200)
    log.size.should eq(2326)
    log.referer.should eq(nil)
    log.method.should eq("GET")
    log.path.should eq("/apache_pb.gif")
    log.protocol.should eq("HTTP/1.0")
    log.uri.should eq("http://127.0.0.1/apache_pb.gif")
    log.time.should eq("2013-07-01T15:59:50")
  end
end
