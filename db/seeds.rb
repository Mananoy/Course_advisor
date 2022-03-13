# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

sample_students = [

  {:account => 'a1743012', :password => 'adelaideuni', :name => 'Matthew Stringer', :residency => 'Domestic' ,
   :qualification => 'Postgraduate', :program => 'MCOMI', :plan => 'MCMPSCI', :year => '2', :expected_completion => '2022 Semester 1' },

  {:account => 'a1716016', :password => 'adelaideuni', :name => 'Mitchell Martinez', :residency => 'Domestic' ,
   :qualification => 'Postgraduate', :program => 'MCOMI', :plan => 'MCMPSCI', :year => '1', :expected_completion => '2023 Semester 2' },

  {:account => 'a1772276', :password => 'adelaideuni', :name => 'Nagadevi Nimeesha Nidadavolu', :residency => 'International' ,
   :qualification => 'Postgraduate', :program => 'MCOMI', :plan => 'MCMPSCI', :year => '1', :expected_completion => '2022 Semester 2',
   :english_exam => 'IELTS', :english_score => '8.0' },

  {:account => 'a1770245', :password => 'adelaideuni', :name => 'Tushar Shirose', :residency => 'Domestic' ,
   :qualification => 'Undergraduate', :program => 'BENGH', :plan => 'BEHSOFTS1', :year => '3', :expected_completion => '2022 Semester 2' },

  {:account => 'a1757552', :password => 'adelaideuni', :name => 'Prateek Arora', :residency => 'International' ,
   :qualification => 'Undergraduate', :program => 'BENGH', :plan => 'BEHSOFTS1', :year => '2', :expected_completion => '2023 Semester 1',
   :english_exam => 'IELTS', :english_score => '6.5' },

  {:account => 'a1781326', :password => 'adelaideuni', :name => 'Zihao Lin', :residency => 'International' ,
   :qualification => 'Undergraduate', :program => 'BENGH', :plan => 'BEHSOFTS1', :year => '1', :expected_completion => '2024 Semester 2',
   :english_exam => 'IELTS', :english_score => '7.0' }

]

sample_students.each do |stu|
  Student.create!(stu)
end


CSV.foreach(Rails.root.join('db/courseData.csv'), headers: true) do |t|
  Course.create( {
   course_ID: t["course_ID"], 
   name: t["name"],
   subject_area: t["subject_area"], 
   catalogue: t["catalogue"],
   prerequisite: t["pre-requisite"],
   corequisite: t["co-requisite"],
   assumed_knowledge: t["assumed_knowledge"],
   description: t["description"],
   unit: t["unit"],
   restriction: t["restriction"],
   pass_rate: t["pass_rate"],
   term: t["term"]
} ) 

  
end

CSV.foreach(Rails.root.join('db/programData.csv'), headers: true) do |t|
  Program.create( {
   program: t["program"],
   plan: t["plan"],
   course_ID: t["course_ID"], 
   course_type: t["course_type"],
   group: t["group"]
} ) 

  
end

#Enrolments
SampleEnrolments= [
  {:student_ID =>'a1770245',:course_ID=>'107808',:term=>3710,:marks=>75},
  {:student_ID =>'a1770245',:course_ID=>'105876',:term=>3710,:marks=>65},
  {:student_ID =>'a1770245',:course_ID=>'19786',:term=>3710,:marks=>78},
  {:student_ID =>'a1770245',:course_ID=>'108277',:term=>3710,:marks=>92},

  {:student_ID =>'a1770245',:course_ID=>'9786',:term=>3720,:marks=>72},
  {:student_ID =>'a1770245',:course_ID=>'108280',:term=>3720,:marks=>62},
  {:student_ID =>'a1770245',:course_ID=>'105877',:term=>3720,:marks=>52},
  {:student_ID =>'a1770245',:course_ID=>'108366',:term=>3720,:marks=>82},

  {:student_ID =>'a1757552',:course_ID=>'107808',:term=>3710,:marks=>85},
  {:student_ID =>'a1757552',:course_ID=>'105876',:term=>3710,:marks=>55},
  {:student_ID =>'a1757552',:course_ID=>'19786',:term=>3710,:marks=>88},
  {:student_ID =>'a1757552',:course_ID=>'108277',:term=>3710,:marks=>92},

  {:student_ID =>'a1757552',:course_ID=>'9786',:term=>3720,:marks=>76},
  {:student_ID =>'a1757552',:course_ID=>'108280',:term=>3720,:marks=>92},
  {:student_ID =>'a1757552',:course_ID=>'105877',:term=>3720,:marks=>62},
  {:student_ID =>'a1757552',:course_ID=>'108366',:term=>3720,:marks=>82},

]

SampleEnrolments.each do |course|
  Enrolment.create!(course)
end


sample_staff = [

  {:account => 'a1674564', :password => 'adelaideuni'},
  {:account => 'a1790076', :password => 'adelaideuni'},
  {:account => 'a1469071', :password => 'adelaideuni'},
  {:account => 'a1234567', :password => 'adelaideuni'},
]

sample_staff.each do |staff|
  Staff.create!(staff)
end
