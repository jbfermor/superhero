class CreateHeros < ActiveRecord::Migration[7.0]
  def change
    create_table :heros do |t|
      t.string :alias
      t.string :real_name
      t.string :universe
      t.text :bio
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
