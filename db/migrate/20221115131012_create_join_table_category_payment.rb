class CreateJoinTableCategoryPayment < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :payments do |t|
      t.index %i[category_id payment_id]
    end
  end
end
