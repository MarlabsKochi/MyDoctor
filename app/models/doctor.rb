class Doctor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  # Associations         
  belongs_to :doctor_category
  has_many :documents, :dependent => :destroy
  accepts_nested_attributes_for :documents
  has_many :time_slots
  accepts_nested_attributes_for :time_slots

  has_attached_file :avatar, styles: { large: "520x520>", medium: "300x300>", small: "256x256>", thumb: "100x100>" }, default_url: ":style/missing_avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # Validations
  validates :name, presence: true

  scope :active, -> { where(active: true) }
end
