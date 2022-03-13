class Student < ApplicationRecord
  has_secure_password

  def self.get_name(s_id)
    name = Student.where(account: s_id).pluck(:name).first
  end

end
