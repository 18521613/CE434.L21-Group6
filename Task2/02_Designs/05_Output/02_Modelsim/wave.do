onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Lab2_tb/CLK
add wave -noupdate -radix unsigned /Lab2_tb/RED
add wave -noupdate -radix unsigned /Lab2_tb/GREEN
add wave -noupdate -radix unsigned /Lab2_tb/BLUE
add wave -noupdate /Lab2_tb/VALID_IN
add wave -noupdate -radix unsigned /Lab2_tb/GRAYSCALE
add wave -noupdate /Lab2_tb/VALID_OUT
add wave -noupdate /Lab2_tb/i
add wave -noupdate /Lab2_tb/write_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1024 ns}
