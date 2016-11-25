class LabelsController < ApplicationController
  def show
    @label = Label.find(param[:id])
  end
end
