module Cms
  class Page < ApplicationRecord
    self.table_name = "pages"

    validates :slug, presence: true

    translates :title, :content
    accepts_nested_attributes_for :translations, allow_destroy: true

    translation_class.validates :title, length: { minimum: 4 }
    translation_class.validates :content, length: { minimum: 3 }
  end
end
