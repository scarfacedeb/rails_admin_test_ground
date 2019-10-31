# frozen_string_literal: true

module Cms
  class Page < ApplicationRecord
    self.table_name = 'pages'

    validates :slug, presence: true

    has_one_attached :preview

    translates :title, :content
    has_many :comments, class_name: '::Comment'

    accepts_nested_attributes_for :translations, allow_destroy: true
    accepts_nested_attributes_for :comments, allow_destroy: true

    translation_class.validates :title, length: { minimum: 4 }
    translation_class.validates :content, length: { minimum: 3 }

    Translation.class_eval do
      has_one_attached :image

      def image=(*)
        self.updated_at = Time.zone.now unless changed?
        super
      end
    end
  end
end
