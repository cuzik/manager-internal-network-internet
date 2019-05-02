class DashboardController < ApplicationController
  def index
    # [TODO]: This line is a simple test to show on view correct room
    @rooms = current_account.rooms.where(id: 1)

    @switches = @rooms.first.&:switches

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
