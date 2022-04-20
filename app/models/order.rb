class Order < ApplicationRecord
  # 注文モデル
enum payment_method: { credit_card: 0, transfer: 1 }
end
