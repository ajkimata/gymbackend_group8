class Client < ApplicationRecord
  # Associations
  has_one :user, as: :role # Link to the User for authentication and registration
  belongs_to :trainer, optional: true # A client can be linked to a trainer

  # Validations
  validates :email, presence: true, uniqueness: true

  # Assuming membership_type can be values like 'beginner', 'intermediate', 'advanced'
  #   validates :membership_type,
  #             inclusion: { in: %w[beginner intermediate advanced], message: '%<value>s is not a valid membership type' }

  #   # Validate the presence of review_text only if review_date is present, and vice versa
  #   validates :review_text, presence: true, if: -> { review_date.present? }
  #   validates :review_date, presence: true, if: -> { review_text.present? }

  #   # Scope to fetch clients based on their fitness level
  #   scope :by_fitness_level, ->(level) { where(membership_type: level) }

  #   # Logic to link clients to trainers can be added here. This can be done based on the membership_type of the client.
  def assign_trainer
    # Fetch trainers based on the client's membership_type and assign
    # This is a basic example, actual logic can depend on many factors like availability of trainers etc.
    self.trainer = Trainer.where(expertise_level: membership_type).first
    save
  end

  # Any other methods or logic related to keeping track of client progress can also be added here.
end
