use <../Library/threadlib/threadlib.scad>

/* [Knob Parameters] */
WHEEL_DIAMETER = 30;
WHEEL_THICKNESS = 5;
HUB_DIAMETER = 10;
SPOKE_COUNT = 8;
SPOKE_WIDTH = 5;
HANDLE_LENGTH = 6;
HANDLE_WIDTH = 6;

/* [Thread Parameters] */
THREAD_DESIGNATOR = "M8";
THREAD_TURNS = 8;
THREAD_GRIP_START = 10;
THREAD_CIRCLE_DEFINITION = 48;

module threaded_shank()
{
    bolt(
        THREAD_DESIGNATOR,
        turns = THREAD_TURNS,
        fn = THREAD_CIRCLE_DEFINITION
    );
}

module wheel_hub()
{
    cylinder(
        d = HUB_DIAMETER,
        h = WHEEL_THICKNESS,
        $fn = THREAD_CIRCLE_DEFINITION
    );
}

module wheel_spoke()
{
    hull()
    {
        translate([HUB_DIAMETER / 2 - 1, 0, 0])
        cylinder(d = SPOKE_WIDTH, h = WHEEL_THICKNESS, $fn = 24);
        translate([WHEEL_DIAMETER / 2 - 4, 0, 0])
        cylinder(d = SPOKE_WIDTH, h = WHEEL_THICKNESS, $fn = 24);
    }
}

module wheel_spokes()
{
    for (spoke = [0:SPOKE_COUNT - 1])
    {
        rotate([0, 0, spoke * 360 / SPOKE_COUNT])
        wheel_spoke();
    }
}

module wheel_rim()
{
    difference()
    {
        cylinder(
            d = WHEEL_DIAMETER,
            h = WHEEL_THICKNESS,
            $fn = THREAD_CIRCLE_DEFINITION
        );
        cylinder(
            d = WHEEL_DIAMETER - 8,
            h = WHEEL_THICKNESS + 0.2,
            $fn = THREAD_CIRCLE_DEFINITION
        );
    }
}

module wheel_handle()
{
    hull()
    {
        translate([WHEEL_DIAMETER / 2 - 2, 0, 0])
        cylinder(d = HANDLE_WIDTH, h = WHEEL_THICKNESS, $fn = 24);
        translate([WHEEL_DIAMETER / 2 + HANDLE_LENGTH - 2, 0, 0])
        cylinder(d = HANDLE_WIDTH, h = WHEEL_THICKNESS, $fn = 24);
    }
}

module wheel_handles()
{
    for (handle = [0:SPOKE_COUNT - 1])
    {
        rotate([0, 0, handle * 360 / SPOKE_COUNT])
        wheel_handle();
    }
}

module knob_grip()
{
    translate([0, 0, THREAD_GRIP_START])
    union()
    {
        wheel_hub();
        wheel_spokes();
        wheel_rim();
        wheel_handles();
    }
}

union()
{
    threaded_shank();
    knob_grip();
}