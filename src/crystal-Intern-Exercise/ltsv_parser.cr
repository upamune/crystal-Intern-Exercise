class LtsvParser
  def self.parse(file_path : String)
    begin
      lines = File.read_lines(file_path)
    rescue
      raise FileNotFoundException.new(file_path)
    end

    lines.map { |line| parse_line(line) }
  end

  def self.parse_line(line : String) : Log
    parsed_line = line.split("\t").map { |l| l.split(":", 2) }.to_h

    begin
      log = Log.new(
        host: parsed_line.fetch("host", ""),
        user: parsed_line.fetch("user", nil),
        epoch: parsed_line.fetch("epoch").to_i,
        req: parsed_line.fetch("req"),
        status: parsed_line.fetch("status").to_i,
        size: parsed_line.fetch("size").to_i,
        referer: parsed_line.fetch("referer", nil)
      )
    rescue
      raise LtsvParseException.new(line)
    end

    log
  end
end

class FileNotFoundException < Exception
  def initialize(path : String)
    super("Invalid File Path: #{path}")
  end
end

class LtsvParseException < Exception
  def initialize(line : String)
    super("ltsv parse error line at: #{line}")
  end
end
