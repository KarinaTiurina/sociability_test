class ResultPrinter
  attr_reader :results

  def initialize
    @results = []

    current_path = __dir__
    file_name = current_path + "/../data/results.txt"

    if File.exist?(file_name)
      @results = File.readlines(file_name, encoding: 'UTF-8')
    else
      @results  = ["Результаты отсутствуют"]
    end
  end

  def print_result(test)
    puts "Оценка ответов:\n" \
      "«да» – 2 очка, «иногда» – 1 очко, «нет» – 0 очков.\n" \
      "Полученные очки суммируются.\n"  \
      "Набрано очков : #{test.total_points}"
    puts

    puts results[test.result_number]
  end
end
