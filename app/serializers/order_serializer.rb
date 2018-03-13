class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_number, :num_items, :total_cost
  has_many :items

  def num_items
    object.items.count
  end

  def total_cost
    object.order_items.reduce(0) do |result, order_item|
      order_item.item_price * order_item.quantity
      result
    end
  end
end
