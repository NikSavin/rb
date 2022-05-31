require 'ostruct'

RSpec.describe 'Объект' do
  context 'ключ-значение' do
    let(:object) do
      OpenStruct.new(key: 'ключ', value: 'значение')
    end

    it 'должен содержать корректный ключ' do
      expect(object.key).to eq('ключ')
    end

    context 'с измененным параметром' do
      before(:each) do 
        object.key = 'новый ключ' # Внутри колбека изменяем у object значение ключа, используем вместо ключа строку "новый ключ".
      end

      it 'должен содержать новый ключ' do # В тесте убеждаемся что сейчас у object атрибут key возвращает строку  "новый ключ"
        expect(object.key).to eq('новый ключ')
      end
    end
  end
end