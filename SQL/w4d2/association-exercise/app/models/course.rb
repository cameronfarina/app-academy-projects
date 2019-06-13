# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null


# Table name: enrollment
#  id         :bigint           not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null

# Table name: users
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#



class Course < ApplicationRecord

    has_many :enrollments,
    class_name: "Enrollment",
    primary_key: :id,
    foreign_key: :course_id

    has_many :enrolled_students,
    through: :enrollments,
    source: :user
    
    belongs_to :prerequisite,
    class_name: "Course",
    primary_key: :id,
    foreign_key: :prereq_id,
    optional: true

    belongs_to :instructor,
    class_name: "User",
    primary_key: :id,
    foreign_key: :instructor_id

end