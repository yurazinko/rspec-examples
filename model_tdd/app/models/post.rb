class Post < ApplicationRecord
  validates :link, uniqueness: { scope: :user_id }
  belongs_to :user

  def short_link
    URI.parse(link).host
  end

  validate :link_format

  private

  def link_format
    unless valid_link?
      errors.add(:link, "Invalid link format")
    end
  end

  def valid_link?
    begin
      !!URI.parse(link)
    rescue URI::InvalidURIError
      false
    end
  end
end
