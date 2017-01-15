class Ad < ApplicationRecord
  belongs_to :user

  JOBS_CATEGORY = 0
  RIDES_CATEGORY = 1
  STAYS_CATEGORY = 2

  scope :by_jobs, lambda { where(category: JOBS_CATEGORY) }
  scope :by_rides, lambda { where(category: RIDES_CATEGORY) }
  scope :by_stays, lambda { where(category: STAYS_CATEGORY) }

end
