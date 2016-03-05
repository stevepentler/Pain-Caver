class TrailsController < ApplicationController 

  def display
    binding.pry
    @trail = TrailService.new(current_user).single_trail(params)
  end
end