class Test
  attr_accessor :total_points, :questions, :current_question, :current_answer

  def initialize
    @questions = []

    current_path = __dir__
    file_name = current_path + "/../data/questions.txt"

    if File.exist?(file_name)
      @questions = File.readlines(file_name, encoding: 'UTF-8')
    else
      @questions  = ["Вопросы отсутствуют"]
    end

    @total_points = 0
    @current_question = 0
    @current_answer = nil # :yes, :no или :sometimes
  end

  def change_current_answer(user_input)
    self.current_answer = case user_input
                          when "1" then :yes
                          when "2" then :no
                          when "3" then :sometimes
                          end
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
    change_current_answer(user_input)
  end

  def add_points
    self.total_points += case current_answer
                         when :yes then 2
                         when :sometimes then 1
                         else 0
                         end
  end

  def next_question
    puts questions[current_question]
    self.current_question += 1

    get_choice

    add_points
  end

  def finished?
    current_question >= questions.size
  end

  def result_number
    if total_points >= 30
      0
    elsif total_points >= 25
      1
    elsif total_points >= 19
      2
    elsif total_points >= 14
      3
    elsif total_points >= 9
      4
    elsif total_points >= 4
      5
    else
      6
    end
  end
end
