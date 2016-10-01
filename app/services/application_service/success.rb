class ApplicationService
  # A successfult result
  class Success < Result
    attr_reader :data

    def initialize(data = {})
      @data = data
      @status = 200
    end

    def to_h
      {
        success: true,
        data: data
      }
    end
  end
end
