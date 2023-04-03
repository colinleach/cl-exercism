class LogLineParser
  def initialize(line)
    @parts = line.split(']:')
  end

  def message
    @parts[1].strip()
  end

  def log_level
    @parts[0].strip().downcase()[1..]
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
