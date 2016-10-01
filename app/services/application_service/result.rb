class ApplicationService
  # Base class for a service result of Success or Failure
  class Result
    attr_reader :status

    def success?
      is_a?(Success)
    end
  end
end
