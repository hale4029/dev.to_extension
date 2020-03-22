class OrganizationMembership < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  validates :user_id, :organization_id, :type_of_user, presence: true
  validates :user_id, uniqueness: { scope: :organization_id }
  validates :type_of_user, inclusion: { in: %w[admin member guest] }

  after_create :update_user_organization_info_updated_at
  after_destroy :update_user_organization_info_updated_at

  def update_user_organization_info_updated_at
    user.touch(:organization_info_updated_at)
  end
end
