include <common.scad>

module switch_plate(is_left = true)
{
    difference()
    {
        offset(5) shape_of_pcb();
        switch_holes_left();
        if (is_left) promicro_cutout();
        screw_holes();
    }
}

module bottom_plate()
{
    difference()
    {
        offset(5) shape_of_pcb();
        screw_holes();
    }
}

module
case_left()
{
    difference()
    {
        minkowski()
        {
            translate([ 0, 0, 5 ]) sphere(r = 5, $fn = 30);
            linear_extrude(height = 0.01) offset(10) shape_of_pcb();
        }
        translate([ 0, 0, -1 ]) linear_extrude(height = 12) switch_holes_left();
        translate([ 0, 0, -1 ]) linear_extrude(height = 12) promicro_cutout();
        translate([ 0, 0, -1 ]) linear_extrude(height = 6) offset(0.5)
            shape_of_pcb();
    }
}

module
case_right()
{
    difference()
    {
        minkowski()
        {
            translate([ 0, 0, 5 ]) sphere(r = 5, $fn = 30);
            linear_extrude(height = 0.01) offset(10)
                translate([ 286.925, 0, 0 ]) mirror([ 1, 0, 0 ]) shape_of_pcb();
        }
        translate([ 0, 0, -1 ]) linear_extrude(height = 12)
            switch_holes_right();
        translate([ 0, 0, -1 ]) linear_extrude(height = 6) offset(0.5)
            translate([ 286.925, 0, 0 ]) mirror([ 1, 0, 0 ]) shape_of_pcb();
    }
}

case_right();
