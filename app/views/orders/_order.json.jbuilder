json.extract! order, :id, :orderdate, :pinwaiter, :pinchef, :attenddate, :payvalue, :status, :created_at, :updated_at, :table_id
json.url order_url(order, format: :json)
