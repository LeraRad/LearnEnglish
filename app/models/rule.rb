class Rule < ApplicationRecord
  validates_presence_of :title, :body
end
