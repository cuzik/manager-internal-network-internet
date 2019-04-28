require 'rails_helper'

RSpec.describe PortsHelper, type: :helper do
  let(:port) {create(:port)}

  context('When the port have editable false') do
    it('should #class_color_port returns "bg-secondary"') do
      port.update(editable: false)

      expect(class_color_port(port)).to eq('bg-secondary')
    end
  end

  context('When the port have editable true') do
    context("and have enabled true") do
      it('should #class_color_port returns "bg-success"') do
        expect(class_color_port(port)).to eq('bg-success')
      end
    end

    context("and have enabled false") do
      it('should #class_color_port returns "bg-danger"') do
        port.update(enabled: false)

        expect(class_color_port(port)).to eq('bg-danger')
      end
    end
  end
end
