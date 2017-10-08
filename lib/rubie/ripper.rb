require 'ripper'

module Rubie
  class Ripper < ::Ripper
    %i(compile_error on_parse_error warn warning).each do |name|
      define_method name do |*args|
        raise Rubie::ParseErrorException.new(args.join)
      end
    end

    def initialize(command)
      super(command)

      @command = command
    end

    def detail
      exp = Ripper.sexp(@command)
      dig(exp)
    end

  private
    def dig(exp)
      puts exp.inspect
      case exp[0]
        when :program
          "このプログラムは#{exp[1].map { |e| dig(e) }.join}いるんだね!"
        when :assign
          "#{dig(exp[1])}に#{dig(exp[2])}を代入して"
        when :var_field
          "変数#{dig(exp[1])}"
        when :method_add_arg
          "#{dig(exp[1])}#{dig(exp[2])}を引数として"
        when :call
          "#{dig(exp[1])}の#{dig(exp[3])}メソッドを呼んで"
        when :binary
          "#{dig(exp[1])}と#{dig(exp[3])}に対して#{get_binary_method(exp[2])}をして"
        when :vcall
          dig(exp[1])
        when :arg_paren
          dig(exp[1])
        when :args_add_block
          exp[1].map { |e| dig(e) }.join
        when :@int
          exp[1].to_s
        when :@float
          exp[1].to_s
        when :@ident
          exp[1].to_s
      end
    end

    def get_binary_method(m)
      puts m
      case m
        when :+
          '加算'
        when :-
          '減算'
        when :*
          '乗算'
        when :/
          '除算'
        when :%
          '剰余の算出'
      end
    end
  end
end
