class Risk < ApplicationRecord
  default_scope { order(position: :asc) }
  belongs_to :risk_group
end
