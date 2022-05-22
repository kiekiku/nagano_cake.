class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre

  def with_tax_price
    (price * 1.1).floor
  end

  def get_image(size)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.png')
      image.attach(io: File.open(file_path), filename: 'no-image.png', content_type: 'image/png')
    end

    if !size.empty?
      image.variant(resize: size)
    else
      image
    end
  end
  def self.recommended
    recommends = []
    active_genres = Genre.all
    active_genres.each do |genre|
      item = genre.items.last
      recommends << item if item
    end
    recommends
  end
end
