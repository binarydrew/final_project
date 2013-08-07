class AddParentIdToTranslations < ActiveRecord::Migration
  def change
    add_reference :translations, :parent, index: true
  end
end
