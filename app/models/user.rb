class User
  include Mongoid::Document

  has_many :accounts, class_name: Account.to_s, inverse_of: :owner
end