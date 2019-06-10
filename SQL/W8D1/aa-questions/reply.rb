class Reply

    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM replies')
        data.map { |datum| Reply.new(datum) }
    end

    def self.find_by_id(id)
        return "there is no parent to this reply" if id.nil?
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM replies
        WHERE replies.id = ?
        SQL

        Reply.new(data.first)
    end

    def self.find_by_author_id(author_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT *
        FROM replies
        WHERE replies.author_id = ?
        SQL

        Reply.new(data.first)
    end

    def self.find_by_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT *
        FROM replies
        WHERE replies.question_id = ?
        SQL

        Reply.new(data.first)
    end

    def self.find_children_replies(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM replies
        WHERE replies.parent_reply_id = ?
        SQL

        data.map { |datum| Reply.new(datum) }
    end

    attr_reader :id
    attr_accessor :question_id, :parent_reply_id, :author_id, :body

    def initialize(options = {})
        @id = options['id']
        @question_id = options['question_id']
        @parent_reply_id = options['parent_reply_id']
        @body = options['body']
        @author_id = options['author_id']
    end
    
    def author
        User.find_by_id(author_id)
    end

    def question
        Question.find_by_id(question_id)
    end

    def parent_reply
        Reply.find_by_id(parent_reply_id)
    end

    def child_replies
        Reply.find_children_replies(id)
    end
end