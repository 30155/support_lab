class Weather < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '晴れ' },
    { id: 2, name: '曇り' },
    { id: 3, name: '雨' },
    { id: 4, name: '雷' },
    { id: 5, name: '雪' },
    { id: 6, name: '雹' },
    { id: 7, name: '霧' },
    { id: 8, name: '大雨' },
    { id: 9, name: '大雪' },
    { id: 10, name: '台風' },
    { id: 11, name: '竜巻' },
    { id: 12, name: '快晴' },
    { id: 13, name: 'その他' }
  ]

end