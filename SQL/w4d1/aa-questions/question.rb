

class Question

    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM questions')
        data.map { |datum| Question.new(datum) }
    end

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM questions
        WHERE questions.id = ?
        SQL

        Question.new(data.first)
    end

    def self.find_by_author_id(author_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT *
        FROM questions
        WHERE questions.author_id = ?
        SQL

        Question.new(data.first)
    end
    
    attr_reader :id
    attr_accessor :title, :body, :author_id

    def initialize(options = {})
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def author
        User.find_by_id(author_id)
    end

    def replies
        Reply.find_by_question_id(id)
    end

    def followers
        Question_follow.followers_for_question_id(id)
    end

    def most_followed(n)
        Question_follow.most_followed_questions(n)
    end
end