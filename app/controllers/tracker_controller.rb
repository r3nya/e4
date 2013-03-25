class TrackerController < ApplicationController
  def index
    @tracker = TrackerLine.all.reverse
  end
end
