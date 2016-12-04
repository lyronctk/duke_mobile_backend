class ApplicationService
  # A failed result
  class Failure < Result
    attr_reader :errors
    # errors - ActiveModel::Errors that occurred
    # options - The Hash options used to describe the error
    #           :status - The Integer HTTP status code for the response
    def initialize(errors:{}, status: 422)
      errors = ActiveModel::Errors.new(errors) if !errors.is_a?(ActiveModel::Errors) 
      @errors = errors
      @status = status  
    end

    def to_h
      {
        success: false,
        errors: serialized_errors
      }
    end

    private

    def serialized_errors
      errors.map do |attribute, message|
        {
          pointer: "data/#{attribute}",
          message: "#{attribute.to_s.humanize} #{message}",
          reason: message
        }
      end
    end
  end
end
