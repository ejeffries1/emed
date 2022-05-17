class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  
  def fullname
    "#{first_name} #{last_name}"
  end
end
