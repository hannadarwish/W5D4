# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :bigint           not null
#  student_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord
    validates :course_id, :student_id, presence: true

    belongs_to :student,
    foreign_key: :student_id,
    primary_key: :id,
    class_name: :User

    belongs_to :course,
    foreign_key: :course_id,
    primary_key: :id,
    class_name: :Course

end
