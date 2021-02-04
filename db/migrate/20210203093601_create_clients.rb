class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.references :user
      t.string     :name,       null: false, default: ""
      t.string     :address,    null: false, default: ""
      t.integer    :cp_number,  null: false
      t.string     :email

      t.timestamps
    end
  end
end
