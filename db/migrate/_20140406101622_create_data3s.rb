class CreateData3s < ActiveRecord::Migration
  def change
    create_table :data3s do |t|
      t.string :col1
      t.string :col2
      t.string :col3
      t.string :col4
      t.string :col5
      t.string :col6
      t.string :col7
      t.string :col8
      t.string :col9
      
      t.string :type
      t.timestamps
    end
  end
end