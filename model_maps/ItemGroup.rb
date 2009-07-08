# auto-generated from json definitions
require 'storable'
module QBXML
  module ModelMaps
    ItemGroup = Storable::OrderedHash[
      :list_id, 'ListID',
      :time_created, 'TimeCreated',
      :time_modified, 'TimeModified',
      :edit_sequence, 'EditSequence',
      :name, 'Name',
      :is_active, 'IsActive',
      :item_desc, 'ItemDesc',
      :unit_of_measure_set_ref_list_id, 'UnitOfMeasureSetRef/ListID',
      :unit_of_measure_set_ref_full_name, 'UnitOfMeasureSetRef/FullName',
      :is_print_items_in_group, 'IsPrintItemsInGroup',
      :special_item_type, 'SpecialItemType'
    ]
  end
end
