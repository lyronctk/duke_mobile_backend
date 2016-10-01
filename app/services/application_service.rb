# Base class for services
class ApplicationService
  include ActiveAttr::Model

  attr_reader :result

  def run
    @run = true
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
