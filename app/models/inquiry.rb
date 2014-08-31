class Inquiry
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include ActionView::Helpers::TextHelper

  attr_accessor :name, :email, :message

  validates :name, presence: true
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
  validates :message, length: { minimum: 10, maximum: 2000 }

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def deliver
    return false unless valid?
    Pony.mail({
      from: %("#{name}" <#{email}),
      reply_to: email,
      subject: 'Website inquiry',
      body: message,
      html_body: simple_format(message)
      })
    true
  end

  def persisted?
    false
  end
end
