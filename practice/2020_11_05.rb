use_bpm 60
use_synth :dull_bell

live_loop :single_note do
  _tick = tick
  if (_tick == 1) then
    play :G3, attack: 2.75, release: 0.25
  end
  sleep 3
end
