class CreateGifs < ActiveRecord::Migration[7.0]
  def change
    create_table :gifs do |t|

      t.timestamps
    end
  end
end
