class RoomPolicy < ApplicationPolicy
  def network_manager?
    user.owner? || record.id == room_permmited&.id
  end

  private

  def room_permmited
    user.account.computers.find_by(
      mac_address: user.get_mac_by_ip,
      owner: true
    )&.room
  end
end
