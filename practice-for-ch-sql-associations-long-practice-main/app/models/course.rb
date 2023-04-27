# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  prereq_id     :bigint
#  instructor_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    validates :name, :instructor_id, presence: true

    has_many :enrollments,
    foreign_key: :course_id,
    primary_key: :id,
    class_name: :Enrollment,
    dependent: :destroy

    has_many :students,
    through: :enrollments,
    source: :student
    
end
