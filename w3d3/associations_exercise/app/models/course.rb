class Course < ActiveRecord::Base
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment

  has_many :enrolled_students,
    through: :enrollments,
    source: :user

  has_one :prerequisite,
    primary_key: :prereq_id,
    foreign_key: :id,
    class_name: :Course

  has_one :instructor,
    # through: :enrollments,
    # source: :user
    primary_key: :instructor_id,
    foreign_key: :id,
    class_name: :User
end