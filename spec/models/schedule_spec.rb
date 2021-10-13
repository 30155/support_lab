require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @schedule = FactoryBot.build(:schedule)
  end

  describe 'スケジュール新規登録' do
    context 'スケジュールの登録できる場合' do
      it '全ての情報が存在すれば登録できる' do
        expect(@schedule).to be_valid
      end
      it 'priorityがなくても登録できる' do
        @schedule.priority = ''
        expect(@schedule).to be_valid
      end
      it 'memoが空でも登録できる' do
        @schedule.memo = ''
        expect(@schedule).to be_valid
      end
    end

    context 'スケジュールの登録できない場合' do
      it 'datetimeが空では登録できない' do
        @schedule.datetime = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Datetime can't be blank")
      end
      it 'planがないと登録できない' do
        @schedule.plan = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Plan can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @schedule.user = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include('User must exist')
      end
    end
  end

end
