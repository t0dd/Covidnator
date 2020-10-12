class CovidnatorGame
  attr_accessor :grid, :inputs, :state, :outputs, :args

  W = 1280
  H = 720

  def defaults
    state.player.x ||= W - 40
    state.player.y ||= 12
    state.player.thrust ||= 0
    state.player.angle ||= 0
    state.player.velRot ||= 0    #velocity rotation
    state.player.vx ||= 0
    state.player.vy ||= 0
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
    outputs.sprites << [state.player.x, state.player.y, 623/20, 658/20, 'sprites/player.png', state.player.angle]
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
    # player movement calculations --------------------------------------
    state.player.rotation += state.player.velRot
    state.player.angle = state.player.rotation * Math::PI/180
    state.player.ax = Math::cos(state.player.angle) * state.player.thrust
    state.player.ay = Math::sin(state.player.angle) * state.player.thrust
    state.player.vx += state.player.ax
    state.player.vy += state.player.ay
    state.player.x += state.player.vx 
    state.player.y += state.player.vy

    # keyboard input -------------------------------------------------------
    if inputs.keyboard.key_up
      state.player.velRot = 0
      state.player.thrust = 0
    end

    if inputs.keyboard.key_held.right
      state.player.velRot = -5
    elsif args.inputs.keyboard.key_held.left
      state.player.velRot = 5
    end

    if inputs.keyboard.key_held.up
      state.player.thrust = 0.1
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