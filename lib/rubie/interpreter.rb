module Rubie
  class Interpreter
    def self.exec
      while true
        print 'rubie > '
        command = gets
        parser = Rubie::Ripper.new(command)

        begin
          parser.parse
        rescue => e
          puts "文法エラーみたい・・・ 「#{e.message}」だって"
          redo
        end

        puts "=> #{eval(command)}"
      end
    end
  end
end
