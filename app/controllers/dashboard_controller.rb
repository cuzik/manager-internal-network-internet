class DashboardController < ApplicationController
  def index
    @switches = current_account.switches.order(:name)
    @ports = @switches.flat_map{|switch| switch.ports.order(:number)}
    @computers = current_account.computers.order(:name)
    @rooms = current_account.rooms.order(:name)
  end
end
