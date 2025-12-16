namespace :cleanup do
  desc "Delete guest accounts older than 24 hours"
  task guest_accounts: :environment do
    User.where(guest: true).where("created_at < ?", 24.hours.ago).destroy_all
  end
end
