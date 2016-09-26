# Base class for services
class ApplicationService
  include ActiveAttr::Model

  attr_reader :errors, :result_data

  def status
    if success?
      200
    else
      422
    end
  end

  def success?
    @success
  end

  def result
    if success?
      success_result
    else
      error_result
    end
  end

  def run
    @errors = []
    @run = true
    if action
      @success = true
    else
      @success = false
    end
  end

  def run?
    !@run.nil?
  end

  private

  def error_result
    {
      success: false,
      status: status,
      errors: errors.map do |attribute, message|
        {
          pointer: "data/#{attribute}",
          message: "#{attribute.to_s.humanize} #{message}",
          reason: message
        }
      end
    }
  end

  def success_result
    {
      success: true,
      status: status,
      data: result_data
    }
  end

  # Failured Servive Result
  class Failure
    def initialize(status: 422)
    end
  end

  # Successful Service Result
  class Success
    def initialize
    end

    def data
    end
  end
end
