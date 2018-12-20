class Test < ActiveRecord::Base
  has_many :users
end

class User < ActiveRecord::Base
  belongs_to :test
end
