class ExerciseAppsController < ApplicationController

  def destroy
    current_user.apps.where(published: false, exercise: true).each(&:destroy)
    redirect_to apps_path
  end

end
