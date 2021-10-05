require 'rails_helper'

RSpec.describe Note, type: :model do
  before do
    @note = FactoryBot.build(:note)
  end

  describe 'ノート新規登録' do
    context 'ノートの登録できる場合' do
      it '全ての情報が存在すれば登録できる' do
        expect(@note).to be_valid
      end
      it 'summaryがなくても登録できる' do
        @note.summary = ''
        expect(@note).to be_valid
      end
      it 'summaryがなくても登録できる' do
        @note.text = ''
        expect(@note).to be_valid
      end
      it 'summaryがなくても登録できる' do
        @note.reference = ''
        expect(@note).to be_valid
      end
    end

    context 'ノートの登録できない場合' do
      it 'wordが空では登録できない' do
        @note.word = ''
        @note.valid?
        expect(@note.errors.full_messages).to include("Word can't be blank")
      end
      it 'word_kanaが空では登録できない' do
        @note.word_kana = ''
        @note.valid?
        expect(@note.errors.full_messages).to include("Word kana can't be blank")
      end
    end
  end
end
