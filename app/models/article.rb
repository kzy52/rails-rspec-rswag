# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
  validates :title, :content, presence: true
end
