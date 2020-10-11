W = 1280
H = 720

def init args
  # initial settings at game start
  args.state.score ||= 0
  args.state.game_over = false
end

def render_background args
  args.outputs.solids << [0,0,W,H, 130,130,130]
end

def render_player args
  args.outputs.sprites << [W / 2, 20, 25, 25, 'sprites/player.png', 0, 256]
end

def render args
  render_background args
  render_player args
end

def tick args
  init args
  render args
end
