require 'rails_helper'

RSpec.describe Experiment, type: :model do
  before do
    @experiment = FactoryBot.build(:experiment)
  end

  describe '実験記録新規登録' do
    context '実験記録の登録できる場合' do
      it '全ての情報が存在すれば登録できる' do
        expect(@experiment).to be_valid
      end
      it 'weather_idがなくても登録できる' do
        @experiment.weather_id = '0'
        expect(@experiment).to be_valid
      end
      it 'temperatureが空でも登録できる' do
        @experiment.temperature = ''
        expect(@experiment).to be_valid
      end
      it 'temperatureがマイナスでも登録できる' do
        @experiment.temperature = '-2'
        expect(@experiment).to be_valid
      end
      it 'humidityが空でも登録できる' do
        @experiment.humidity = ''
        expect(@experiment).to be_valid
      end
      it 'memberが空でも登録できる' do
        @experiment.member = ''
        expect(@experiment).to be_valid
      end
      it 'purposeが空でも登録できる' do
        @experiment.purpose = ''
        expect(@experiment).to be_valid
      end
      it 'experimental_methodが空でも登録できる' do
        @experiment.experimental_method = ''
        expect(@experiment).to be_valid
      end
      it 'condition1が空でも登録できる' do
        @experiment.condition1 = ''
        expect(@experiment).to be_valid
      end
      it 'condition2が空でも登録できる' do
        @experiment.condition2 = ''
        expect(@experiment).to be_valid
      end
      it 'resultが空でも登録できる' do
        @experiment.result = ''
        expect(@experiment).to be_valid
      end
      it 'considerationが空でも登録できる' do
        @experiment.consideration = ''
        expect(@experiment).to be_valid
      end
      it 'noteが空でも登録できる' do
        @experiment.note = ''
        expect(@experiment).to be_valid
      end
    end

    context '実験記録の登録できない場合' do
      it 'datetimeが空では登録できない' do
        @experiment.datetime = ''
        @experiment.valid?
        expect(@experiment.errors.full_messages).to include("Datetime can't be blank")
      end
      it 'temperatureが数値でないと登録できない' do
        @experiment.temperature = 'abc'
        @experiment.valid?
        expect(@experiment.errors.full_messages).to include('Temperature is invalid. Input numbers.')
      end
      it 'humidityが数値でないと登録できない' do
        @experiment.humidity = 'abc'
        @experiment.valid?
        expect(@experiment.errors.full_messages).to include('Humidity is invalid. Input numbers.')
      end
      it 'temperatureが「-」だけでは登録できない' do
        @experiment.temperature = '-'
        @experiment.valid?
        expect(@experiment.errors.full_messages).to include('Temperature is invalid. Input numbers.')
      end
      it 'humidityが「-」だけでは登録できない' do
        @experiment.humidity = '-'
        @experiment.valid?
        expect(@experiment.errors.full_messages).to include('Humidity is invalid. Input numbers.')
      end
      it 'temperatureが「.」だけでは登録できない' do
        @experiment.temperature = '.'
        @experiment.valid?
        expect(@experiment.errors.full_messages).to include('Temperature is invalid. Input numbers.')
      end
      it 'humidityが「.」だけでは登録できない' do
        @experiment.humidity = '.'
        @experiment.valid?
        expect(@experiment.errors.full_messages).to include('Humidity is invalid. Input numbers.')
      end
      it 'titleが空では登録できない' do
        @experiment.title = ''
        @experiment.valid?
        expect(@experiment.errors.full_messages).to include("Title can't be blank")
      end
    end
  end
end
