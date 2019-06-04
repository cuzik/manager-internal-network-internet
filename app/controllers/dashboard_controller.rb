class DashboardController < ApplicationController
  def index
    @rooms = current_user.owner? ? current_account.rooms :
      [current_account.computers.find_by(
        mac_address: current_user.get_mac_by_ip,
        owner: true
      )&.room].compact

      @counts = create_count_elements_hash
  end

  private

  def create_count_elements_hash
    {
      switches: current_account.switches.count,
      ports: current_account.ports.count,
      computers: current_account.computers.count,
      rooms: current_account.rooms.count,
      users: current_account.users.count
    }
  end
end
