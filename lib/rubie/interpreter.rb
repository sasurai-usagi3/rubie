module Rubie
  class Interpreter
    def self.exec
      world = Object.new.__binding__

      puts 'おはよう、今日も私と一緒に遊んでくれるんだねっ!嬉しい!'
      while true
        print 'rubie > '
        command = gets
        if command.nil?
          puts "\nまたねー"
          return '遊んでくれてありがとう'
        end
        parser = Rubie::Ripper.new(command)

        begin
          parser.parse
          ret = eval(command, world)
          puts parser.detail
          puts "=> #{ret}"
        rescue Rubie::ParseErrorException => e
          puts "文法エラーみたい・・・ 「#{e.message}」だって"
        rescue ArgumentError => e
          puts '引数違うよー'
        rescue NoMethodError => e
          puts "#{e.receiver}に「#{e.name}」って名前のメソッドが定義されてないってー!"
        rescue NameError => e
          puts "#{e.receiver}に「#{e.name}」って名前の変数かメソッドが定義されてないってー!"
        end
      end
    end
  end
end
