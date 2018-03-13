class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :num_orders
  has_many :orders

  def price
   object.order_items.average(:item_price)
  end

  def num_orders
    object.orders.count
  end
end
