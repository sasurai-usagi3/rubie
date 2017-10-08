require 'ripper'

module Rubie
  class Ripper < ::Ripper
    %i(compile_error on_parse_error warn warning).each do |name|
      define_method name do |*args|
        raise Rubie::ParseErrorException.new(args.join)
      end
    end
  end
end
