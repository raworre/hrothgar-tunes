# frozen_string_literal: true

# Sonic Pi 2020-08-05
use_bpm 120

live_loop :kick do
  # stop
  [1, 0, 1, 0].each do |vol|
    sample :bd_mehackit, amp: vol * 2
    sleep 1
  end
end

live_loop :snare do
  # stop
  [0, 1, 0, 1].each do |vol|
    sample :sn_generic, amp: vol
    sleep 1
  end
end

def hat(v)
  sample :drum_cymbal_closed, amp: v
end

live_loop :hihat do
  # stop
  a = [0, 0, 0, 0, 1].choose
  case a
  when 0
    8.times do
      hat 1
      sleep 0.5
    end
  when 1
    tripVol = 1.5
    2.times do
      hat tripVol
      sleep 0.3
      hat tripVol
      sleep 0.3
      hat tripVol
      sleep 0.4
    end
  end
end

live_loop :progression do
  # stop
  vol = 0.75
  with_fx :reverb do
    use_synth :pulse
    play chord(:f3, :minor), sustain: 4, attack: 0, release: 0, amp: vol
    play chord(:f3, :minor), amp: vol
    sleep 4
    play chord(:c3, :minor), sustain: 4, attack: 0, release: 0, amp: vol
    play chord(:c3, :minor), amp: vol
    sleep 4
    play chord(:cs3, :major), sustain: 4, attack: 0, release: 0, amp: vol
    play chord(:cs3, :major), amp: vol
    sleep 4
    play chord(:as3, :minor), sustain: 4, attack: 0, release: 0, amp: vol
    play chord(:as3, :minor), amp: vol
    sleep 4
  end
end

live_loop :arp do
  # stop
  sync :progression
  _tick = tick
  _vol = 1
  # with_fx :ixi_techno do
    # use_synth :pulse
    _chord = chord(:as3, :minor)
    # i-iv-v-i is kinda moody
    # i-iii-vii-i is kinda bright
    # _prog = [0, 3, 4, 0]
    _prog = [0, 2, 6, 0]
    _pan = -1
    _prog.each do |_index|
      2.times do
        play _chord[_index], amp: _vol, pan: _pan
        sleep 0.3
        play _chord[_index], amp: _vol, pan: _pan
        sleep 0.3
        play _chord[_index], amp: _vol, pan: _pan
        sleep 0.4
      end
      _pan = _pan * -1
    end
    sleep 0.9
  # end
end

live_loop :sfx do
  stop
  sync :kick
  dir = '\sonic-pi-source\samples\2020-08-05'
  sample dir, [0, 1, 2].choose, amp: 2, beat_stretch: 4
  sleep 8
end
