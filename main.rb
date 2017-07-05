# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'test'
require_relative 'result_printer'

version = "Оценка уровня общительности (тест В.Ф. Ряховского)\n" \
  "Версия 0.2.\n\n"

puts version

name = ARGV[0]

if name == nil
  name = "Таинственная персона"
end

puts "Добрый день, #{name}! \n" \
  "Тест содержит возможность определить уровень коммуникабельности человека." \
  " Отвечать на вопросы следует используя три варианта ответов – «да»," \
  " «иногда» и «нет»."
puts

test = Test.new
printer = ResultPrinter.new

until test.finished?
  test.next_question
end

puts name
puts
printer.print_result(test)
