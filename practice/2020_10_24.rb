use_bpm 140
use_synth :dsaw

## MAJOR SCALES

# Major = R->W->W->H->W->W->W->H
$CM = [:C,:D,:E,:F,:G,:A,:B]

# Mixolydian = R->W->W->H->W->W->H->W
$CMix = [:C,:D,:E,:F,:G,:A,:Bb]

# Lydian = R->W->W->W->H->W->W->H
$CLyd = [:C,:D,:E,:Fs,:G,:A,:B]

# Lydian Dominant = R->W->W->W->H->W->H->W
$CLydDom = [:C,:D,:E,:Fs,:G,:A,:Bb]

# Phyrigian Dominant = R->H->WH->H->W->H->W->W
$CPhryDom = [:C,:Db,:E,:F,:G,:Ab,:Bb]

# Harmonic Major = R->W->W->H->W->H->WH->H
$CHarmMaj = [:C,:D,:E,:F,:G,:Ab,:B]

# Mixolydia B6 = R->W->W->H->W->H->W->W
$CMixB6 = [:C,:D,:E,:F,:G,:Ab,:Ab]

## MINOR SCALES

# Natural Minor (Aeolian) = R->W->H->W->W->H->W->W
$CAeol = [:C,:D,:Eb,:F,:G,:Ab,:Bb]

# Dorian = R->W->H->W->W->W->H->W
$CDor = [:C,:D,:Eb,:F,:G,:A,:Bb]

# Harmonic Minor = R->W->H->W->W->H->WH->H
$CHarmMin = [:C,:D,:Eb,:F,:G,:Ab,:B]

# Melodic Minor = R->W->H->W->W->W->W->H
$CMelodMin = [:C,:D,:Eb,:F,:G,:A,:B]

# Phrygian = R->H->W->W->W->H->W->W->W
$CPhry = [:C,:Db,:Eb,:F,:G,:Ab,:Bb]

# Locrian = R->H->W->W->H->W->W->W
$CLoc = [:C,:Db,:Eb,:F,:Gb,:Ab,:Bb]

## NOT MAJOR OR MINOR

# Blues = R->WH->W->H->H->WH->W
$CBlue = [:C,:Eb,:F,:Fs,:G,:Bb]

# Altered = R->H->W->H->W->W->W->W
$CAlt = [:C,:Db,:Eb,:E,:Gb,:Ab,:Bb]

## PENTATONIC SCALES

# Major Pentatonic = R->W->W->WH->W->WH
$CMajPent = [:C,:D,:E,:G,:A]

# Minor Pentatonic = R->WH->W->W->WH->W
$CMinPent = [:C,:Eb,:F,:G,:Bb]

## SYNTHETIC SCALES

# Chromatic = R->H->H->H->H->H->H->H->H->H->H->H->H
$CChrom = [:C,:Cs,:D,:Ds,:E,:F,:Fs,:G,:Gs,:A,:As,:B]

# Whole Tone = R->W->W->W->W->W->W
$CWhole = [:C,:D,:E,:Fs,:Gs,:As]

# Octatonic = R->W->H->W->H->W->H->W->H
$COct = [:C,:D,:Ds,:F,:Fs,:Gs,:A,:B]

# Blues = R->WH->W->H->H->WH->W
$Eb2_Blues = [:Eb2,:Gb2,:Ab2,:A2,:Bb2,:Db3,:Eb3]
$Gb2_Blues = [:Gb2,:A2,:B2,:C3,:Db3,:E3,:Gb3]
$Ab2_Blues = [:Ab2,:B2,:Db3,:D3,:Eb3,:Gb3,:Ab3]
$A2_Blues = [:A2,:C3,:D3,:Eb3,:E3,:G3,:A3]
$Bb2_Blues = [:Bb2,:Db3,:Eb3,:E3,:F3,:Ab3,:Bb3]
$Db3_Blues = [:Db3,:E3,:Gb3,:G3,:Ab3,:B3,:Db]
$Eb3_Blues = [:Eb3,:Gb3,:Ab3,:A3,:Bb3,:Db,:Eb]

live_loop :scalez do
  # stop
  # sync :main
  $tick = tick
  if ($tick % 7 == 0) then
    puts "Tick: #{$tick} = Eb2"
    $scle = $Eb2_Blues
  elsif ($tick % 7 == 1) then
    puts "Tick: #{$tick} = Gb2"
    $scle = $Gb2_Blues
  elsif ($tick % 7 == 2) then
    puts "Tick: #{$tick} = Ab2"
    $scle = $Ab2_Blues
  elsif ($tick % 7 == 3) then
    puts "Tick: #{$tick} = A2"
    $scle = $A2_Blues
  elsif ($tick % 7 == 4) then
    puts "Tick: #{$tick} = Bb2"
    $scle = $Bb2_Blues
  elsif ($tick % 7 == 5) then
    puts "Tick: #{$tick} = Db3"
    $Scle = $Db3_Blues
  else
    puts "Tick: #{$tick} = Eb3"
    $scle = $Eb3_Blues
  end
  $scle.each do |note|
    play note, amp: 0.5
    sleep 1
  end
  sleep 1
end

live_loop :kick do
  # stop
  # sync :scalez
  [1, 0, 1, 0, 1, 0, 1, 0].each do |vol|
    # sample :bd_mehackit, amp: vol * 3
    # sample :bd_sone, amp: vol * 3
    # sample :bd_zome, amp: vol * 3
    sample :bd_tek, amp: vol * 3
    sleep 1
  end
end

live_loop :snare do
  # stop
  # sync :kick
  [0, 1, 0, 1, 0, 1, 0, 1].each do |vol|
    sample :drum_snare_hard, amp: vol * 1
    sleep 1
  end
end
