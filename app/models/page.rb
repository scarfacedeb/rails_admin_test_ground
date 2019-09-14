class Page < ApplicationRecord
  translates :title, :content

  rails_admin do
  end
end
