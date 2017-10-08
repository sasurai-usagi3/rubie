module Rubie
  class ParseErrorException < ::StandardError
    attr_reader :message

    def initialize(message)
      @message = message
    end
  end
end
