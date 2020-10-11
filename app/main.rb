class CovidnatorGame
  attr_accessor :grid, :inputs, :state, :outputs, :args

  W = 1280
  H = 720

  def tick
    render
  end

  def render_background 
    outputs.solids << [0,0,W,H, 130,130,130]
  end

  def render_player
    outputs.sprites << [W/2, 24, 128/5, 71/4, 'sprites/player.png']
  end

  def render 
    render_background 
    render_player
  end
end

$game = CovidnatorGame.new

def tick args
  $game.args = args
  $game.state = args.state
  $game.outputs = args.outputs
  $game.tick
end