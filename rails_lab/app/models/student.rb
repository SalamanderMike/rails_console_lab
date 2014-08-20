class Student < ActiveRecord::Base
  validates :first_name,  :presence => true,
                          :length => 4,
                          :uniqueness => true,
                          :format => {:with => /\A[A-Z][a-zA-Z]+$/, :message => "Name must Capitalized and contain only letters"}
  validates :last_name,   :presence => true,
                          :length => 4,
                          :uniqueness => true,
                          :format => {:with => /\A[A-Z][a-zA-Z]+$/, :message => "Name must Capitalized and contain only letters"}
validates_with FullName, :fields => [:first_name, :last_name]
end


# Custom Validation
class FullName < ActiveModel::Validator
  def validate(record)
# rails console stopped working, so I could not finish testing/developing this idea
    if [:fields.join].any?{|field| (field === evilNames) }
      record.errors[:base] << "This person is evil"
    end
  end
end

