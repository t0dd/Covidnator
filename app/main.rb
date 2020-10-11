class CovidnatorGame
  attr_accessor :grid, :inputs, :state, :outputs, :args

  W = 1280
  H = 720

  def defaults
    state.player.x ||= W/2
  end

  def tick
    defaults
    render
    process_inputs
  end

  def render_background 
    outputs.solids << [0,0,W,H, 130,130,130]
  end

  def render_player
    outputs.sprites << [state.player.x, 24, 128/5, 71/4, 'sprites/player.png']
  end

  def render 
    render_background 
    render_player
  end

  def process_inputs
    process_inputs_game
  end

  def process_inputs_game
    
    if inputs.keyboard.key_held.right
      state.player.x += 10
    elsif args.inputs.keyboard.key_held.left
      state.player.x -= 10
    end
  end
end

$game = CovidnatorGame.new

def tick args
  $game.args = args
  $game.inputs = args.inputs
  $game.state = args.state
  $game.outputs = args.outputs
  $game.tick
end