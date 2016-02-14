class CreateTranslationMessages < ActiveRecord::Migration
  def change
    create_table :translation_messages do |t|
      t.references :translation, index: true
      t.references :user, index: true, null: false
      t.text       :body, null: false

      t.timestamps null: false
    end
  end
end
