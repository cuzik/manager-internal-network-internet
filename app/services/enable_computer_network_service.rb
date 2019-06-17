class EnableComputerNetworkService
  def execute(computer_id)
    #call smntp
    Computer.find(computer_id).port&.change_status!
  end
end
