ActiveRecord::Schema.define do
  self.verbose = false

  create_table :tests, force: true do |t|
    t.string :name
    t.integer :alter
    t.string :ort

    t.timestamps
  end

  create_table :users, force: true do |t|
    t.string :key
    t.string :name
    t.integer :age
    t.datetime :dob

    t.timestamps
  end
end
