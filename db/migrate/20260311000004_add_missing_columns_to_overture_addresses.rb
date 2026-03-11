# frozen_string_literal: true

class AddMissingColumnsToOvertureAddresses < ActiveRecord::Migration[8.0]
  def change
    add_column :overture_addresses, :number, :string unless column_exists?(:overture_addresses, :number)
    add_column :overture_addresses, :unit, :string unless column_exists?(:overture_addresses, :unit)
    add_column :overture_addresses, :address_levels, :jsonb, default: [] unless column_exists?(:overture_addresses, :address_levels)
  end
end
