class CreateArtisanalCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :artisanal_collections do |t|
      t.references :container, foreign_key: true
      t.references :article, foreign_key: true
      
      t.timestamps
    end
  end
end
