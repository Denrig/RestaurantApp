class ApplicationRecord < ActiveRecord::Base
  include SecurityHelper
  self.abstract_class = true
end
