class Student < ActiveRecord::Base
  validates :first_name,  :presence => true,
                          :length => {:minimum => 4},
                          :uniqueness => true,
                          :format => {:with => /\A[A-Z][a-zA-Z]+\z/, :message => "Name must Capitalized and contain only letters"}
  validates :last_name,   :presence => true,
                          :length => {:minimum => 4},
                          :uniqueness => true,
                          :format => {:with => /\A[A-Z][a-zA-Z]+\z/, :message => "Name must Capitalized and contain only letters"}
# validates_with FullName, :fields => [:first_name, :last_name]
end


# # Custom Validation
# class FullName < ActiveModel::Validator
#   def validate(record)
#     names = ["TimLicata", "DelmerReed", "AnilBridgpal ", "ElieSchoppik"]
# # rails console stopped working, so I could not finish testing/developing this idea
#     if [:fields.join].any? |field|
#       names.each do |name|
#         if field === name
#           record.send(field) == "Evil"
#         end
#       end
#       record.errors[:base] << "This person is evil"
#     end
#   end
# end

# # Adam's Solution
# def FullName
#   if names.include?([first_name, last_name])
#     errors.add(:first_name, "#{first} is evil!")
#   end
# end
