class Test
  def initialize
    @questions = []

    current_path = File.dirname(__FILE__)
    file_name = current_path + "/data/questions.txt"

    if File.exist?(file_name)
        f = File.new(file_name, 'r:UTF-8')
        @questions = f.readlines
        f.close
      else
        @questions  = ["Вопросы отсутствуют"]
    end

    @total_points = 0
    @current_question = 0
  end

  def get_choice
    user_input = nil

    until user_input.to_i.between?(1, 3)
      puts "Сделайте свой выбор:\n" \
        "1. Да\n" \
        "2. Нет\n" \
        "3. Иногда"
      user_input = STDIN.gets.chomp
      puts
    end
    return user_input
  end

  def add_points(user_input)
    case user_input
    when "1"
      @total_points += 2
    when "3"
      @total_points += 1
    end
  end

  def next_question
    puts @questions[@current_question]
    @current_question += 1

    user_input = get_choice

    add_points(user_input)
  end

  def finished?
    @current_question >= @questions.size
  end

  def total_points
    @total_points
  end
end
