module NS
  class Page < ApplicationRecord
    self.table_name = "pages"

    translates :title, :content
    accepts_nested_attributes_for :translations, allow_destroy: true
  end
end
