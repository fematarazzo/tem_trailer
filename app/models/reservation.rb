class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :trailer

  validates :start_date, :end_date, presence: true

  def info
    "#{trailer.model}\n
    De #{start_date.strftime("%Y/%m/%d")} a #{end_date.strftime("%Y/%m/%d")}\n
    Preço da diária: #{price}\n
    Preço Total: #{total}\n
    Endereço: #{trailer.address}"
  end
end
