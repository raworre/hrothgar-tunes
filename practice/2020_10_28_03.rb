use_bpm 140
use_synth :piano

live_loop :main do
  # stop
  sleep 12.01
end

# live_loop test

_ebm_scale = (scale :Eb3, :minor)

def play_chord_and_acc(_chord)
  play _chord, amp: 0.4
  sleep 1
  play _chord[1], amp: 0.3
  sleep 1
  play _chord[2], amp: 0.3
  sleep 1
  play _chord[1], amp: 0.3
  sleep 1
end

live_loop :prog do
  # stop
  sync :main
  _ebm = (scale :Eb3, :major)
  puts "I = #{note_info(_ebm[0]).midi_string}"
  puts "IV = #{note_info(_ebm[3]).midi_string}"
  puts "V = #{note_info(_ebm[4]).midi_string}"
  4.times do
    play_chord_and_acc (chord _ebm[0], :major)
  end
  2.times do
    play_chord_and_acc (chord _ebm[3], :major)
  end
  2.times do
    play_chord_and_acc (chord _ebm[0], :major)
  end
  1.times do
    play_chord_and_acc (chord _ebm[4], :major)
  end
  1.times do
    play_chord_and_acc (chord _ebm[3], :major)
  end
  1.times do
    play_chord_and_acc (chord _ebm[0], :major)
  end
  1.times do
    play_chord_and_acc (chord _ebm[4], :major)
  end
end

live_loop :kick do
  # stop
  sync :main
  [1,0,1,0,1,0,1,0,1,0,1,0].each do |_vol|
    sample :bd_boom, amp: 0.5 * _vol
    sleep 1
  end
end
