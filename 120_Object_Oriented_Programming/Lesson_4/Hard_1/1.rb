# class SecurityLogger
#   def create_log_entry
#     Time.now
#   end
# end

# class SecretFile
#   attr_reader :logs
  
#   def initialize(secret_data, security = SecurityLogger.new)
#     @data = secret_data
#     @security = security
#     @logs = []
#   end
  
#   def data
#     @logs << "data accessed #{@security.create_log_entry}"
#     @data
#   end
# end

# data1 = SecretFile.new("secret_text")

# puts data1.data
# puts data1.data
# puts data1.data

# puts data1.logs

class SecurityLogger
  attr_reader :logs
  
  def initialize
    @logs = []
  end
  
  def create_log_entry
    @logs << "data was accessed #{Time.now}"
  end
end

class SecretFile
  attr_reader :logs
  
  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end
  
  def data
    @logger.create_log_entry
    @data
  end
  
  def get_logs
    @logger.logs
  end
end

data1 = SecretFile.new("secret_text", SecurityLogger.new)

puts data1.data
puts data1.data
puts data1.data

puts data1.get_logs