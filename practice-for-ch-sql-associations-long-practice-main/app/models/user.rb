# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :name, presence: true

    has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

    has_many :courses,
    through: :enrollments,
    source: :course

    has_many :enrolled_courses,
    through: :enrollments,
    source: :course

    has_many :courses_taught,
    foreign_key: :instructor_id,
    primary_key: :id,
    class_name: :Course

end
