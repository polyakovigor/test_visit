class User < ApplicationRecord
  require 'csv'

  validates :name, presence: true, uniqueness: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      User.create row.to_h
    end
  end
end
