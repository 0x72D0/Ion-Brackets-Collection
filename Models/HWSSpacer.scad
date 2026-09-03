use <../Library/hws_openscad_attachments_and_connectors.scad>

/* [Spacer Dimensions] */
HEX_ACROSS_FLATS = 35;
FRONT_PLATE_THICKNESS = 3;
STANDOFF_DISTANCE = 18;
HWS_BODY_ACROSS_FLATS = 19.7;
HWS_CONNECTOR_TOLERANCE = 0;
NECK_DIAMETER = 12;
NECK_LENGTH = 2;

// The HWS insert extends from the wall in +Y.  Neck length extends the total
// stand-off without shortening the tapered spacer section.
HWS_INSERT_DEPTH = 10;
BODY_START = HWS_INSERT_DEPTH + NECK_LENGTH;
BODY_DEPTH = max(1, STANDOFF_DISTANCE - HWS_INSERT_DEPTH);
FRONT_PLATE_POSITION = BODY_START + BODY_DEPTH;
PLATE_BEVEL = min(0.8, FRONT_PLATE_THICKNESS / 3);

module hex_prism(across_flats, depth)
{
	rotate([ -90, 0, 0 ])
		cylinder(d = across_flats * 2 / sqrt(3), h = depth, $fn = 6);
}

module hex_frustum(rear_across_flats, front_across_flats, depth)
{
	rotate([ -90, 0, 0 ])
		cylinder(
			d1 = rear_across_flats * 2 / sqrt(3),
			d2 = front_across_flats * 2 / sqrt(3),
			h = depth,
			$fn = 6
		);
}

module front_plate()
{
	translate([ 0, FRONT_PLATE_POSITION, 0 ])
		union()
		{
			hex_frustum(HEX_ACROSS_FLATS - 2 * PLATE_BEVEL, HEX_ACROSS_FLATS, PLATE_BEVEL);
			translate([ 0, PLATE_BEVEL, 0 ])
				hex_prism(HEX_ACROSS_FLATS, FRONT_PLATE_THICKNESS - 2 * PLATE_BEVEL);
			translate([ 0, FRONT_PLATE_THICKNESS - PLATE_BEVEL, 0 ])
				hex_frustum(HEX_ACROSS_FLATS, HEX_ACROSS_FLATS - 2 * PLATE_BEVEL, PLATE_BEVEL);
		}
}

module spacer_body()
{
	translate([ 0, BODY_START, 0 ])
		hex_frustum(HWS_BODY_ACROSS_FLATS, HEX_ACROSS_FLATS - 2, BODY_DEPTH);
}

module connector_neck()
{
	translate([ 0, HWS_INSERT_DEPTH - 0.1, 0 ])
		rotate([ -90, 0, 0 ])
			cylinder(d = NECK_DIAMETER, h = NECK_LENGTH + 0.2, $fn = 36);
}

module hws_connector()
{
	rotate([ -90, 0, 0 ])
		insert_plug_adv([[1]], tolerance = HWS_CONNECTOR_TOLERANCE, decoration = false);
}

union()
{
	hws_connector();
	connector_neck();
	spacer_body();
	front_plate();
}
