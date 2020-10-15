use_bpm 140
use_synth :mod_sine

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
  [1, 1, 1, 0, 1, 0, 1, 0].each do |vol|
    sample :bd_ada, amp: vol * 3
    sleep 1
  end
end

live_loop :chord_progression do
  stop
  $chords = $ebm
  play $chords[0][0], sustain: 7, decay: 0.5, amp: 0.25
  play $chords[0], sustain: 1, decay: 0.5, attack: 0.25
  sleep 2
  play $chords[4], sustain: 1, decay: 0.5, attack: 0.25
  sleep 2
  play $chords[5], sustain: 1, decay: 0.5, attack: 0.25
  sleep 2
  play $chords[2], sustain: 1, decay: 0.5, attack: 0.25
  sleep 2
  play $chords[3][0], sustain: 7, decay: 0.5, amp: 0.25
  play $chords[3], sustain: 1, decay: 0.5, attack: 0.25
  sleep 2
  play $chords[0], sustain: 1, decay: 0.5, attack: 0.25
  sleep 2
  play $chords[3], sustain: 1, decay: 0.5, attack: 0.25
  sleep 2
  play $chords[4], sustain: 1, decay: 0.5, attack: 0.25
  sleep 2
end
