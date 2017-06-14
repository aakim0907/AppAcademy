require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Question
  attr_accessor :title, :body, :user_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_user_id(user_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL
    return nil unless question.length > 0

    question.map { |question| Question.new(question) }
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id)
      INSERT INTO
        questions (title, body, user_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id, @id)
      UPDATE
        questions
      SET
        title = ?, body = ?, user_id = ?
      WHERE
        id = ?
    SQL
  end

  def user #author
    user = QuestionsDatabase.instance.execute(<<-SQL, @user_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    User.new(user.first)
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end
end

class User
  attr_accessor :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_name(fname, lname)
    users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL

    User.new(users.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
  end

  def authored_questions
    Question.find_by_user_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    # need to do a left outer join because want rows for ALL the questions, not just the
    # ones in QuestilnLikes, which are only questions that have likes
    avg_likes = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        avg(question_likes) as abc
      FROM (
        SELECT
          count(*) as question_likes
        FROM
          questions
        LEFT OUTER JOIN
          question_likes ON questions.id = question_likes.question_id
        WHERE
          question_likes.user_id = ?
        GROUP BY -- need to group by questions.id and NOT question_likes.question_id because
        -- want to include all questions in the grouping (not just liked questions)
          questions.id)
    SQL
    avg_likes.first["abc"]
  end
end


class Reply
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_user_id(user_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    return nil unless reply.length > 0

    reply.map { |rep| Reply.new(rep)}
  end

  def self.find_by_question_id(question_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil unless reply.length > 0

    reply.map { |rep| Reply.new(rep) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @body = options['body']
    @user_id = options['user_id']
    @parent_reply_id = options['parent_reply_id']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @question_id, @body, @user_id, @parent_reply_id)
      INSERT INTO
        replies (question_id, body, user_id, parent_reply_id)
      VALUES
        (?, ?, ?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, @question_id, @body, @user_id, @parent_reply_id, @id)
      UPDATE
        replies
      SET
        question_id = ?, body = ?, user_id = ?, parent_reply_id = ?
      WHERE
        id = ?
    SQL
  end

  def author
    user = QuestionsDatabase.instance.execute(<<-SQL, @user_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    User.new(user.first)
  end

  def question
    question = QuestionsDatabase.instance.execute(<<-SQL, @question_id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    Question.new(question.first)
  end

  def parent_reply
    reply = QuestionsDatabase.instance.execute(<<-SQL, @parent_reply_id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    return nil if reply.length < 1
    Reply.new(reply.first)
  end

  def child_replies
    reply = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = ?
    SQL
    return nil if reply.length < 1
    Reply.new(reply.first)
  end
end

class QuestionFollow
  def self.followers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_follows ON users.id = question_follows.user_id
      WHERE
        question_follows.question_id = ?
    SQL
    return nil unless users.length > 0

    users.map { |user| User.new(user) }
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id
      WHERE
        question_follows.user_id = ?
    SQL
    return nil unless questions.length > 0

    questions.map { |question| Question.new(question) }
  end

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      -- SELECT
      --   questions.id
      -- FROM
      --   questions
      -- JOIN (
      --   SELECT
      --     question_follows.question_id, count(*) AS user_count
      --   FROM
      --     users
      --   JOIN
      --     question_follows ON users.id = question_follows.user_id
      --   GROUP BY
      --     question_follows.question_id
      -- ) AS question_follower_counts ON questions.id = question_follower_counts.question_id
      -- ORDER BY
      --   question_follower_counts.user_count DESC
      -- LIMIT ?
      SELECT
        questions.title, questions.body, questions.user_id, questions.id
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id
      GROUP BY
        questions.title, questions.body, questions.user_id, questions.id
      ORDER BY
        count(*)
      LIMIT ?
    SQL

    return nil if questions.length < 1
    questions.map { |question| Question.new(question) }
  end
end

class QuestionLike
  def self.likers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_likes ON users.id = question_likes.user_id
      WHERE
        question_likes.question_id = ?
    SQL
    return nil unless users.length > 0

    users.map { |user| User.new(user) }
  end

  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        question_likes.user_id = ?
    SQL
    return nil unless questions.length > 0

    questions.map { |question| Question.new(question) }
  end

  def self.num_likes_for_question_id(question_id)
    likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*) AS like_count
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL
    likes.first['like_count']
  end

  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.title, questions.body, questions.user_id, questions.id
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      GROUP BY
        questions.title, questions.body, questions.user_id, questions.id
      ORDER BY
        count(*)
      LIMIT ?
    SQL

    return nil if questions.length < 1
    questions.map { |question| Question.new(question) }
  end
end
