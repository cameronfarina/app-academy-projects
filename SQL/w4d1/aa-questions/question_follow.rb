require_relative 'questions_database'
require_relative 'user'
require_relative 'question'

class Question_follow

    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM question_follows')
        data.map { |datum| Question_follow.new(datum) }
    end

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM question_follows
        WHERE question_follows.id = ?
        SQL

        Question_follow.new(data.first)        
    end
    
    def self.followers_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT *
        FROM users
        JOIN question_follows ON question_follows.user_id = users.id
        WHERE question_follows.question_id = ?
        SQL

        Question_follow.new(data.first) 
    end

    def self.followed_questions_for_user_id(user_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT *
        FROM questions
        JOIN question_follows ON questions.id = question_follows.question_id
        WHERE question_follows.user_id = ?
        SQL

        Question_follow.new(data.first) 
    end

    def self.most_followed_questions(n)
        data = QuestionsDatabase.instance.execute(<<-SQL, n)
        SELECT *
        FROM questions
        JOIN question_follows ON questions.id = question_follows.question_id
        GROUP BY questions.id
        ORDER BY COUNT(*) DESC
        LIMIT ?
        SQL

        data.map { |datum| Question_follow.new(datum) }
    end

    attr_reader :id
    attr_accessor :question_id, :user_id

    def initialize(options = {})
        @question_id = options['question_id']
        @user_id = options['user_id']
        @id = options['id']
    end    

end