# Create Accounts
p "Create Accounts"

udesc = Account.create!(name: "Udesc")

# Create Users
p "Create Users"

User.create!(
  name: "Administrador 1",
  email: "adm@gmail.com",
  password: "nopasswd",
  account: udesc,
  owner: true,
  cpf: "111.111.111-11"
)

User.create!(
  name: "Professor 1",
  email: "professor1@gmail.com",
  password: "nopasswd",
  account: udesc,
  owner: false,
  cpf: "222.222.222-22"
)

User.create!(
  name: "Professor 2",
  email: "professor2@gmail.com",
  password: "nopasswd",
  account: udesc,
  owner: false,
  cpf: "333.333.333-33"
)

# Create Switch
p "Create Switch"

switch_one = Switch.create!(name: "switch 01", mac_address: "AA:AA:AA:AA:AA:AA", account: udesc)
switch_two = Switch.create!(name: "switch 02", mac_address: "BB:BB:BB:BB:BB:BB", account: udesc)
switch_three = Switch.create!(name: "switch 03", mac_address: "CC:CC:CC:CC:CC:CC", account: udesc)

# Create Room
p "Create Room"

room_301 = Room.create!(name: "301", account: udesc)
room_302 = Room.create!(name: "302", account: udesc)

# Create Port and Computer
p "Create Port and Computer"

Port.create!(number: 1, enabled: true, editable: false, switch: switch_one)
(2..24).each do |number|
  port = Port.create!(number: number, enabled: true, editable: true, switch: switch_one)
  Computer.create!(name: "pc_301_#{number}", owner: false, mac_address: "AA:AA:BB:BB:CC:#{number+10}", ip: "192.168.0.#{50 + number}", account: udesc)
end

Port.create!(number: 1, enabled: true, editable: false, switch: switch_two)
(2..24).each do |number|
  port = Port.create!(number: number, enabled: true, editable: true, switch: switch_two)
  Computer.create!(name: "pc_302_#{number}", owner: false, mac_address: "AA:AA:BB:BB:#{number+10}:C1", ip: "192.168.0.#{100 + number}", account: udesc)
end

Port.create!(number: 1, enabled: true, editable: false, switch: switch_three)
(2..24).each do |number|
  port = Port.create!(number: number, enabled: true, editable: true, switch: switch_three)
  Computer.create!(name: "pc_302_3#{number}", owner: false, mac_address: "AA:AA:BB:BB:#{number+50}:C1", ip: "192.168.0.#{150 + number}", account: udesc)
end



