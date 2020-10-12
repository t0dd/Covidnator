class CovidnatorGame
  attr_accessor :grid, :inputs, :state, :outputs, :args

  W = 1280
  H = 720

  def defaults
    state.player.x ||= W/2
    state.player.y ||= 24
    state.player.speed ||= 3
    state.player.direction ||= 0
  end

  def tick
    defaults
    render
    process_inputs
  end

  def render_background 
    outputs.solids << [0,0,W,H, 117,132,155]
  end
  def render_pence
    outputs.sprites << [0, 320, 550, 400, 'sprites/pence.png']
  end

  def render_player
    outputs.sprites << [state.player.x, state.player.y, 623/20, 658/20, 'sprites/player.png', state.player.direction]
  end

  def render 
    render_background 
    render_pence
    render_player
  end

  def process_inputs
    process_inputs_game
  end

  def process_inputs_game
    # keyboard input -------------------------
    if inputs.keyboard.key_held.right
      state.player.x += state.player.speed
      state.player.direction = 270
    elsif args.inputs.keyboard.key_held.left
      state.player.x -= state.player.speed
      state.player.direction = 90
    end

    if inputs.keyboard.key_held.up
      state.player.y += state.player.speed
      state.player.direction = 0
    elsif args.inputs.keyboard.key_held.down
      state.player.y -= state.player.speed
      state.player.direction = 180
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