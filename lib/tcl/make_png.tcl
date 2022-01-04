# inspired by
# https://ughe.github.io/2018/11/13/gtkwave-automation

set nfacs [ gtkwave::getNumFacs ]
set all_facs [list]
for {set i 0} {$i < $nfacs } {incr i} {
    set facname [ gtkwave::getFacName $i ]
    lappend all_facs "$facname"
}
set num_added [ gtkwave::addSignalsFromList $all_facs ]
puts "num signals added: $num_added"

# zoom full
gtkwave::/Time/Zoom/Zoom_Full

# Print
set dumpname [ gtkwave::getDumpFileName ]
gtkwave::/File/Grab_To_File $dumpname.png

gtkwave::/File/Quit


