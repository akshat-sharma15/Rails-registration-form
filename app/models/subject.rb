class Subject < ApplicationRecord
  belongs_to :user

  include Visible
end
