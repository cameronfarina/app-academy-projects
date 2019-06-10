require_relative 'questions_database'
require_relative 'user'
class Question_like

    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM question_likes')
        data.map { |datum| Question_like.new(datum) }
    end

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM question_likes
        WHERE question_likes.id = ?
        SQL

        Question_like.new(data.first)
    end

    def self.likers_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT *
        FROM users
        JOIN question_likes ON users.id = question_likes.user_like_id
        WHERE question_likes.user_question_id = ?
        SQL

        data.map { |datum| User.new(datum) }
    end

    def self.num_likes_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT COUNT(*) AS likes
        FROM questions
        JOIN question_likes ON questions.id = question_likes.user_question_id
        WHERE questions.id = ?
        SQL
    end

    attr_reader :id
    attr_accessor :user_like_id, :user_question_id

    def initialize(options = {})
        @id = options['id']
        @user_like_id = options['user_like_id']
        @user_question_id = options['user_question_id']
    end

end