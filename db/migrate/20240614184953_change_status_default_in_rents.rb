class ChangeStatusDefaultInRents < ActiveRecord::Migration[7.1]
  def change
    change_column_default :rents, :status, from: nil, to: 'pending'
  end
end
