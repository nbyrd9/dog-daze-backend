class CreateDogActions < ActiveRecord::Migration[6.1]
  def change
    create_table :dog_actions do |t|
      t.string :name
      t.string :time
      t.string :description
      t.string :mood

      t.timestamps
    end
  end
end
