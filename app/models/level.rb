class Level < ActiveHash::Base
  self.data = [
    { id: 1, value: 1, name: '---' },
    { id: 2, value: 1.2, name: 'ほとんど運動しない（座っている仕事など）' },
    { id: 3, value: 1.375, name: '軽い運動をする（週に1〜3回の軽い運動）' },
    { id: 4, value: 1.55, name: '適度に運動をする（週に3〜5回の運動）' },
    { id: 5, value: 1.725, name: '高い頻度で運動をする（週に6〜7回の運動）' },
    { id: 6, value: 1.9, name: '極めて高い頻度で運動をする（1日に2回以上のハードな運動）' }
  ]

  include ActiveHash::Associations
  has_many :users

  end