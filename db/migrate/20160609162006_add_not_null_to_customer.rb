class AddNotNullToCustomer < ActiveRecord::Migration
  def change
    change_column_null(:customers, :name, false)
    change_column_null(:customers, :email, false)
    change_column_null(:customers, :city_id, false)
    change_column_null(:customers, :rut, false)
  end
end
