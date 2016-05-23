class TransferSchool
  include Mongoid::Document

  has_many :transfer_courses, dependent: :destroy

  field :title, type: String
  field :city, type: String
  field :state, type: String
  field :code, type: String

  validates_uniqueness_of :code
end
