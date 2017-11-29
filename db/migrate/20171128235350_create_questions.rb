class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.column :question, :string
      t.column :category, :string
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
