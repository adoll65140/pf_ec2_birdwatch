class ProtectionChecksController < ApplicationController
  def create
    protection_bird = ProtectionBird.find(params[:protection_bird_id])
    protection_check = current_user.protection_checks.new(protection_bird_id: protection_bird.id)
    protection_check.save
    redirect_to protection_bird_path(protection_bird)
  end

  def destroy
    protection_bird = ProtectionBird.find(params[:protection_bird_id])
    protection_check = current_user.protection_checks.find_by(protection_bird_id: protection_bird.id)
    protection_check.destroy
    redirect_to protection_bird_path(protection_bird)
  end
end
