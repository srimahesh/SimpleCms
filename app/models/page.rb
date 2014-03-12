class Page < ActiveRecord::Base

	belongs_to :subject   # Singular   make sure you have a fk
	# has_and_belongs_to_many :admin_users, :join_table => "admin_users_pages"
	# has_and_belongs_to_many :admin_users
	has_and_belongs_to_many :editors, :class_name => "AdminUser"

	scope :sorted, lambda { order("pages.position ASC")}
end
