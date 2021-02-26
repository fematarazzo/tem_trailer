class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :trailer

  validates :start_date, :end_date, presence: true
  def info
    "<b>#{trailer.model}</b>\n
    De #{start_date.strftime("%Y/%m/%d")} a #{end_date.strftime("%Y/%m/%d")}\n
    Preço da diária: $ #{trailer.price}\n
    Endereço: #{trailer.address}"
  end
end
