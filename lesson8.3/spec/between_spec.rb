RSpec.describe 'Число' do
	it 'должно входить в диапазон' do
	  expect(5).to be_between(1, 10)
	end

	it 'входит в диапазон массивов' do
	  expect([1, 2, 3]).to include(1)
	end
end