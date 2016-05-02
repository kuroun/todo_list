class Item < ActiveRecord::Base
	belongs_to :list
	validates :title, :list_id, :presence => true
end
