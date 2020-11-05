################################################################################

use_bpm 160

_vol = 0.0
live_loop :main do
  # stop
  sleep 8.0001
end

_arr = [0,0.1,0.2,0.3,0.4,0.5]
# _arr = [0.5,0.4,0.3,0.2,0.1,0]
live_loop :intro do
  # stop
  sync_bpm :main
  _vol = _arr.tick
  sleep 4
  _vol = _arr.tick
  sleep 4
  if (_vol == 0.5) then stop end
end

live_loop :test do
  # stop
  sync_bpm :main
  _tick = tick
  puts "Tick #{_tick}"
  pan_left = [1, 0.3, 0.7, 0, -0.7, -0.3, -1]
  pan_right = [-1, -0.3, -0.7, 0, 0.7, 0.3, 1]
  if (_tick % 2 == 0) then
    pan_vals = pan_right
  else
    pan_vals = pan_left
  end
  
  dm_scale = (scale :D3, :diatonic)
  effects_vals = [
    [pan_vals[0], rrand(0.5,1)],
    [pan_vals[1], rrand(0,0.25)],
    [pan_vals[2], rrand(0.5,1)],
    [pan_vals[3], rrand(0,0.25)],
    [pan_vals[4], rrand(0.5,1)],
    [pan_vals[5], rrand(0,0.25)],
    [pan_vals[6], rrand(0.5,1)]
  ]
  effects_vals.each do |pan_val, mix_val|
    puts "Pan Val: #{pan_val}"
    puts "Mix Val: #{mix_val}"
    with_synth :blade do
      with_fx :ring_mod, mix: mix_val do
        play dm_scale.choose, amp: 0.3 * _vol, pan: pan_val
      end
    end
    sleep 1
  end
  sleep 1
end

live_loop :kick do
  # stop
  sync_bpm :main
  [1,1,1,0,1,1,1,0].each do |vol|
    sample :bd_boom, amp: 0.3 * vol * _vol
    sleep 1
  end
end

live_loop :snap do
  # stop
  sync_bpm :main
  [0,0,0,1,0,0,0,1].each do |vol|
    sample :drum_tom_lo_hard, beat_stretch: 1, amp: 0.15 * vol * _vol
    sleep 1
  end
end
