u1 = User.create(user_name: 'Kelly')
u2 = User.create(user_name: 'Aaron')
u3 = User.create(user_name: 'David')

p1 = Poll.create(title: 'Programming Language', user_id: u1.id)
p2 = Poll.create(title: 'State', user_id: u2.id)

q1 = Question.create(text: 'What is your favorite programming language?', poll_id: p1.id)
q2 = Question.create(text: 'What is your favorite state?', poll_id: p2.id)

a11 = AnswerChoice.create(text: 'Ruby', question_id: q1.id)
a12 = AnswerChoice.create(text: 'JavaScript', question_id: q1.id)
a13 = AnswerChoice.create(text: 'Python', question_id: q1.id)
a21 = AnswerChoice.create(text: 'California', question_id: q2.id)
a22 = AnswerChoice.create(text: 'Michigan', question_id: q2.id)
a23 = AnswerChoice.create(text: 'New York', question_id: q2.id)

r11 = Response.create(user_id: u3.id, answer_id: a11.id)
r12 = Response.create(user_id: u2.id, answer_id: a12.id)
# r13 = Response.create(user_id: u1.id, answer_id: a13.id)
r21 = Response.create(user_id: u3.id, answer_id: a21.id)
# r22 = Response.create(user_id: u2.id, answer_id: a22.id)
r23 = Response.create(user_id: u1.id, answer_id: a22.id)
