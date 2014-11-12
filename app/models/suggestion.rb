class Suggestion < ActiveRecord::Base
  belongs_to :suggester, class_name: "User"
end
