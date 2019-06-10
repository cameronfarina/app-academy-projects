require_relative 'questions_database'
require_relative 'question'
require_relative 'reply'
require_relative 'question_follow'

class User

    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM users')
        data.map { |datum| User.new(datum) }
    end

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM users
        WHERE users.id = ?
        SQL

        User.new(data.first)
    end

    def self.find_by_name(fname, lname)
        data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT *
        FROM users
        WHERE users.fname = ? AND users.lname = ?
        SQL

        User.new(data.first)
    end

    attr_reader :id
    attr_accessor :fname, :lname

    def initialize(options = {})
        @fname = options['fname']
        @lname = options['lname']
        @id = options['id']
    end

    def authored_questions
        Question.find_by_author_id(id)
    end

    def authored_replies
        Reply.find_by_author_id(id)
    end

    def followed_questions
        Question_follow.followed_questions_for_user_id(id)
    end
end
