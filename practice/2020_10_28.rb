use_bpm 140
use_synth :dsaw

$Eb2_Blues = [:Eb2,:Gb2,:Ab2,:A2,:Bb2,:Db3,:Eb3]
$Gb2_Blues = [:Gb2,:A2,:B2,:C3,:Db3,:E3,:Gb3]
$Ab2_Blues = [:Ab2,:B2,:Db3,:D3,:Eb3,:Gb3,:Ab3]
$A2_Blues = [:A2,:C3,:D3,:Eb3,:E3,:G3,:A3]
$Bb2_Blues = [:Bb2,:Db3,:Eb3,:E3,:F3,:Ab3,:Bb3]
$Db3_Blues = [:Db3,:E3,:Gb3,:G3,:Ab3,:B3,:Db]
$Eb3_Blues = [:Eb3,:Gb3,:Ab3,:A3,:Bb3,:Db,:Eb]
$Eb2_Blues_Scales = [
  $Eb2_Blues,
  $Gb2_Blues,
  $Ab2_Blues,
  $A2_Blues,
  $Bb2_Blues,
  $Db3_Blues,
  $Eb3_Blues
]

$scaleyz = [
  $Eb2_Blues_Scales[0],
  $Eb2_Blues_Scales[4],
  $Eb2_Blues_Scales[5],
  $Eb2_Blues_Scales[2],
  $Eb2_Blues_Scales[3],
  $Eb2_Blues_Scales[0],
  $Eb2_Blues_Scales[3],
  $Eb2_Blues_Scales[4]
]

live_loop :prog do
  stop
  $ticky = tick
  puts "Tick: #{$ticky}"
  $Eb2_Blues_Scales[(tick % 7)].each do |note|
    puts "Note: #{note}"
    play note, amp: 0.5
    sleep 1
  end
  sleep 1
end

$notez = scale :Eb2, :blues_minor
$prog = [$notez[0], $notez[3], $notez[0], $notez[3], $notez[0], $notez[4], $notez[0]]

live_loop :note_test do
  # stop
  $prog.each do |note|
    puts "Note: #{note_info(note).midi_string}"
    play note, amp: 0.5
    sleep 1
  end
  sleep 1
end

live_loop :note_test_2 do
  stop
  # sync :note_test
  $t = tick
  $n = $prog[($t % 7)]
  $nstr = note_info($n).midi_string
  puts "Chord: #{$nstr[0..]}"
  $c = chord $nstr, :minor
  with_synth :dpulse do
    play $c, attack: 0.4, sustain: 7, decay: 0.5, amp: 0.5
  end
  sleep 7.9
end

$ebms = scale :Eb1, :minor
$ebmcp = [$ebms[0], $ebms[2], $ebms[5], $ebms[6]]
live_loop :note_test_3 do
  # stop
  sync :note_test
  $t = tick
  $n = $ebmcp[($t % 4)]
  $nstr = note_info($n).midi_string
  $c = chord $nstr, :minor
  puts "Chord: #{$nstr}"
  with_synth :dpulse do
    play $c, attack: 0.4, sustain: 7, decay: 0.5, amp: 0.5
  end
  sleep 7.9
end
