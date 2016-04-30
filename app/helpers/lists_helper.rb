module ListsHelper
  def items_count state, list_id
    Item.where(list_id: list_id).where(state: state).count
  end
  def item_state_css state
    color = 'not_start' if(state=='not started')
    color = 'progress' if(state=='in progress')
    color = 'complete' if(state=='complete')
    color
  end
end
