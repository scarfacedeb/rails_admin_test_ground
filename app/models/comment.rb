# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :page, class_name: '::Cms::Page'
  has_one_attached :screenshot
end
