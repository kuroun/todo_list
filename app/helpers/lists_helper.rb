module ListsHelper
  def items_count state, list_id
    Item.where(list_id: list_id).where(state: state).count
  end
end
