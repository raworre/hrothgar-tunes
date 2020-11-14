use_bpm 140

live_loop :root do
  _vol = 0.5
  use_synth :dtri
  sync :arp
  with_fx :flanger do
    play chord(:fs3, :minor), sustain: 2, amp: _vol
    sleep 2
    play chord(:a3, :minor), sustain: 2, amp: _vol
    sleep 2
    play chord(:as3, :minor), sustain: 2, amp: _vol
    sleep 2
    play chord(:fs3, :minor), sustain: 2, amp: _vol
    sleep 2
  end
end

live_loop :arp do
  stop
  use_synth :chiplead
  _prog = [0, 0, 4, 0, 3, 3, 4, 4]
  _scale = scale(:fs, :minor)
  _prog.each do |_index|
    play _scale[_index], amp: 0.25
    sleep 1
  end
end

live_loop :kick do
  sync :arp
  # sample :bd_mehackit, beat_stretch: 6
  # with_fx :reverb do
    [1, 0, 1, 0, 1, 0, 1].each do |_amp|
      play :f1, attack: 0, sustain: 1.5, decay: 0, release: 0, amp: 0.5 * _amp
      sleep 1
    end
    sleep 0.9
  # end
end

# live_loop :arp do
#   _prog = [0, 2, 6]
#   _scale = scale(:as3, :minor)
#   _prog.each do |_index|
#     1.times do
#       play _scale[_index]
#       sleep 0.3
#       play _scale[_index]
#       sleep 0.3
#       play _scale[_index]
#       sleep 0.4
#     end
#     sleep 1
#   end
# end
