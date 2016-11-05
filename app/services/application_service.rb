# Base class for services
class ApplicationService
  include ActiveAttr::Model

  attr_reader :result
  attr_reader :request_info

  def run(request_info)
    @run = true
    @request_info = request_info
    @result = action
  end

  def run?
    !@run.nil?
  end

  def success?
    @result.is_a?(Success)
  end

  # Trigger autoloading
  Success
  Failure
end
