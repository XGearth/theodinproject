class TracksController < ApplicationController
  def show
    @track = Track.friendly.find(params[:id])
    @courses = decorated_courses
    @user = current_user
  end

  def index
    @tracks = Track.all
  end

  private

  def decorated_courses
    @track.courses.map { |course| CourseDecorator.new(course) }
  end
end
