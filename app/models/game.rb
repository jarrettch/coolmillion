class Game
  include Mongoid::Document

  field :date_played, type: Date
  field :location, type: String
  field :game_type, type: String
  field :stakes, type: String
  field :hours_played, type: Float
  field :profit_or_loss, type: Float
  field :notes, type: String

end