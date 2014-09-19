class AddMarkupToPages < ActiveRecord::Migration
  def up
    add_column :pages, :markup, :string
    Page.update_all markup: 'HTML'
    change_column_null :pages, :markup, false
  end

  def down
    remove_column :pages, :markup
  end
end
