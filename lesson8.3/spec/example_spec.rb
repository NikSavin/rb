RSpec.describe 'Привет' do # В методе discribe мы описываем что мы тестируем
	it 'должен работать в случае false' do # В методе it реализуем тест
	  expect(false).to be_falsy
	end

	it 'должен работатьв случае true' do
	  expect(true).to be_truthy
	end
end