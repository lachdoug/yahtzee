class Section < ApplicationRecord

  belongs_to :page

  default_scope { order(order: :asc) }

end
