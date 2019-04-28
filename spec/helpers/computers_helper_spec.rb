require 'rails_helper'

RSpec.describe ComputersHelper, type: :helper do
  let(:computer) {create(:computer)}
  let(:switch) {create(:switch, account: computer.account)}
  let(:port) {create(:port, switch: switch, computer: computer)}

  context("When the computer haven't an associated port") do
    it('should #class_color_computer returns "bg-warning"') do
      expect(class_color_computer(computer)).to eq('bg-warning')
    end
  end

  context("When the computer is an owner") do
    it('should #class_color_computer returns "bg-info"') do
      port.computer.update!(owner: true)

      expect(class_color_computer(computer)).to eq('bg-info')
    end
  end

  context("When have an associated port with enabled true") do
    it('should #class_color_computer returns "bg-success"') do
      expect(class_color_computer(port.computer)).to eq('bg-success')
    end
  end

  context("When have an associated port with enabled false") do
    it('should #class_color_computer returns "bg-danger"') do
      port.update(enabled: false)

      expect(class_color_computer(computer)).to eq('bg-danger')
    end
  end
end
