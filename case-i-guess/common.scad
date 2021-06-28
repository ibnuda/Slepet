module sector(radius, angles, fn = 60)
{
    r = radius / cos(180 / fn);
    step = -360 / fn;

    points = concat(
        [[ 0, 0 ]],
        [for (a = [angles[0]:step:angles[1] - 360])[r * cos(a), r * sin(a)]],
        [[r * cos(angles[1]), r * sin(angles[1])]]);

    difference()
    {
        circle(radius, $fn = fn);
        polygon(points);
    }
}

module arc(radius, angles, width = 1, fn = 60)
{
    difference()
    {
        sector(radius + width, angles, fn);
        sector(radius, angles, fn);
    }
}

module
shape_of_pcb()
{
    center_of_upper_body_angles = [-12, -472];
    center_of_lower_body_angles = [15, -214];
    center_of_upper_pinky_angles = [-0, -358];
    center_of_lower_pinky_angles = [-0, -716];
    upper_body_angles = [75, 84];
    upper_pinky_angles = [84, 90];
    lower_body_angles = [0, 86];
    lower_pinky_angles = [87, 91];
    difference()
    {
        union()
        {
            translate(center_of_upper_body_angles) sector(562.5, upper_body_angles, 360);
            translate(center_of_upper_pinky_angles) sector(434.5, upper_pinky_angles, 360);
            polygon(points= [
                [128.75, -17.90],
                [138.5, -1.25],
                [134.75, 0.8],
                [152.25, 66.1],
                [133.55, 71.35],
                [111.5, -10.6],
            ]);
        }
        translate(center_of_upper_body_angles) sector(300, upper_body_angles, 360);
        translate(center_of_lower_body_angles) sector(226.5, lower_body_angles, 360);
        translate(center_of_lower_pinky_angles) sector(735, lower_pinky_angles, 360);
    }
}

module switch_holes()
{
    import("plate-left.dxf");
}

tightening_screw_positions = [
    [-1, 77],
    [-1, 18],
    [62, 6],
    [129, -19],
    [155, 66],
    [91, 82],
];

module
screw_holes()
{
    for (i=[0:5]) {
        translate(tightening_screw_positions[i]) circle(r=1.2);
    }
}