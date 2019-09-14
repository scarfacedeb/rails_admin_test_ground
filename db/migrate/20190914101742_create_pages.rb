class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :slug

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Page.create_translation_table! title: :string, content: :text
      end

      dir.down do
        Page.drop_translation_table!
      end
    end
  end
end
