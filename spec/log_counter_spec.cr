require "./spec_helper"

describe Crystal::Intern::Exercise do
  logs = LtsvParser.parse("./sample_data/log.ltsv")

  it "エラー数が正しくカウントされていること" do
    log_counter = LogCounter.new(logs)
    log_counter.count_error.should eq(2)
  end

  it "ユーザごとにログがグループ化されていること" do
    log_counter = LogCounter.new(logs)
    grouped_logs = log_counter.group_by_user

    john = "john"
    john_logs = grouped_logs.fetch(john)
    john_logs.size.should eq(1)
    john_logs.each do |log|
      log.user.should eq(john)
    end

    guest = "guest"
    guest_logs = grouped_logs.fetch(guest, [] of Log)
    guest_logs.size.should eq(0)
    guest_logs.each do |log|
      log.user.should eq(guest)
    end

    frank = "frank"
    frank_logs = grouped_logs.fetch(frank)
    frank_logs.size.should eq(3)
    frank_logs.each do |log|
      log.user.should eq(frank)
    end
  end

  it "パスごとにログがグループ化されていること" do
    log_counter = LogCounter.new(logs)
    group_by_path_logs = log_counter.group_by_path

    group_by_path_logs.size.should eq(2)
    group_by_path_logs.fetch("/apache_pb.gif").size.should eq(4)
    group_by_path_logs.fetch("/notfound.gif").size.should eq(1)
  end

  it "日付ごとにログがグループ化されていること" do
    log_counter = LogCounter.new(logs)
    group_by_date_logs = log_counter.group_by_date

    group_by_date_logs.fetch("2013-07-01").size.should eq(2)
    group_by_date_logs.fetch("2013-07-02").size.should eq(2)
    group_by_date_logs.fetch("2013-07-03").size.should eq(1)

  end


end
