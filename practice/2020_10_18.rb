use_bpm 140
use_synth :sine

$ebm = [
  chord(:Eb3, :minor),
  chord(:F3, :diminished),
  chord(:Gb3, :major),
  chord(:Ab3, :minor),
  chord(:Bb3, :minor),
  chord(:Cb3, :major),
  chord(:Db3, :major)
]

live_loop :kick do
  # stop
  puts "Kick"
  [1, 1, 1, 0, 0, 1, 1, 1].each do |vol|
    sample :bd_ada, amp: vol * 3
    sleep 1
  end
end

live_loop :chord do
  # stop
  sync :kick
  $tick = tick
  if ($tick % 4 == 1) then
    $dacord = $ebm[2]
  elsif ($tick %4 == 2) then
    $dacord = $ebm[6]
  else $dacord = $ebm[0]
  end
  puts "Tick: #{$tick}"
  play $ebm[0], attack: 0.25, sustain: 3.5, decay: 0.25, amp: 2
  sleep 4
  play $ebm[2], attack: 0.25, sustain: 3.5, decay: 0.25
  sleep 4
  play $ebm[6], attack: 0.25, sustain: 3.5, decay: 0.25
  sleep 4
  play $ebm[0], attack: 0.25, sustain: 3.5, dcay: 0.25
end
