class DashboardController < ApplicationController
  def index
    @switches = current_account.switches
    @ports = current_account.ports
    @computers = current_account.computers
    @rooms = current_account.rooms
  end
end
