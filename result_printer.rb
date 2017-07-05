class ResultPrinter
  def initialize
    @results = []

    current_path = File.dirname(__FILE__)
    file_name = current_path + "/data/results.txt"

    if File.exist?(file_name)
        f = File.new(file_name, 'r:UTF-8')
        @results = f.readlines
        f.close
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
    if test.total_points >= 30
      puts @results[0]
    elsif test.total_points >= 25
      puts @results[1]
    elsif test.total_points >= 19
      puts @results[2]
    elsif test.total_points >= 14
      puts @results[3]
    elsif test.total_points >= 9
      puts @results[4]
    elsif test.total_points >= 4
      puts @results[5]
    else
      puts @results[6]
    end
  end
end
