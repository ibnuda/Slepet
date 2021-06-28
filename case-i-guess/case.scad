include <common.scad>

difference()
{
    offset(r=5) shape_of_pcb();
    switch_holes();
    screw_holes();
}