class Response < ApplicationRecord
  validate :not_duplicate_response
  validate :author_cant_respond_to_own_poll
  validates :user_id, :answer_id, presence: true

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  private

  def not_duplicate_response
    if respondent_already_answered?
      errors[:user_id] << "You can't answer same question twice"
    end
  end

  def author_cant_respond_to_own_poll
    puts answer_choice.question.poll.user_id == self.user_id
    if answer_choice.question.poll.user_id == self.user_id
      errors[:user_id] << "Author can't respond to own poll!"
    end
  end

end
