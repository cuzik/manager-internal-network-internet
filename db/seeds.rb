# Create Accounts

udesc = Account.create(name: "Udesc")

#Create Users

User.create(
  name: "Administrador 1",
  email: "adm@gmail.com",
  password: "nopasswd",
  account: udesc,
  owner: true
)

User.create(
  name: "Professor 1",
  email: "professor1@gmail.com",
  password: "nopasswd",
  account: udesc,
  owner: false
)

User.create(
  name: "Professor 2",
  email: "professor2@gmail.com",
  password: "nopasswd",
  account: udesc,
  owner: false
)

# Create Switch

switch_one = Switch.create(name: "switch 01", mac_address: "AA:AA:AA:AA:AA:AA")
switch_two = Switch.create(name: "switch 02", mac_address: "BB:BB:BB:BB:BB:BB")
switch_three = Switch.create(name: "switch 03", mac_address: "CC:CC:CC:CC:CC:CC")

# Create Room

room_301 = Room.create(name: "301", account: udesc)
room_302 = Room.create(name: "302", account: udesc)

# Create Port and Computer

Port.create(number: 1, enabled: true, editabled: false, switch: switch_one)
(2..24).each do |number|
  port = Port.create(number: number, enabled: true, editabled: false, switch: switch_one)
  Computer.create(name: "pc_301_01", owner: true, mac_address: "AA:AA:BB:BB:CC:#{number+10}", ip: "192.168.0.#{50 + number}", room: room_301, port_id: port.id)
end

Port.create(number: 1, enabled: true, editabled: false, switch: switch_two)
(2..24).each do |number|
  port = Port.create(number: number, enabled: true, editabled: false, switch: switch_two)
  Computer.create(name: "pc_302_#{number}", owner: true, mac_address: "AA:AA:BB:BB:#{number+10}:C1", ip: "192.168.0.#{100 + number}", room: room_302, port_id: port.id)
end

Port.create(number: 1, enabled: true, editabled: false, switch: switch_three)
(2..24).each do |number|
  port = Port.create(number: number, enabled: true, editabled: false, switch: switch_three)
  Computer.create(name: "pc_302_1#{number}", owner: true, mac_address: "AA:AA:BB:BB:#{number+50}:C1", ip: "192.168.0.#{150 + number}", room: room_302, port_id: port.id)
end



