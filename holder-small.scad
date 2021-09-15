module Holder(angle=30, thickness=3, width=40, height=90, lenght_x=50, panel_thickness = 3, x_size = 50, y_size = 40, cut_out_size = 20, z_size = 15, hole_radius = 2, hole_margin=5) {
    difference() {
        union() {
            cube([x_size, y_size - cut_out_size, thickness]);
            cube([x_size - cut_out_size, width, thickness]);
        }
        
        translate([x_size - hole_margin, hole_margin, -1]) {
            #cylinder(r = hole_radius, h = thickness + 2);
        }
        
        translate([z_size + hole_margin, hole_margin, -1]) {
            #cylinder(r = hole_radius, h = thickness + 2);
        }
        
        translate([z_size + hole_margin, y_size - hole_margin, -1]) {
            #cylinder(r = hole_radius, h = thickness + 2);
        }
    }
    cube([z_size, thickness, height + panel_thickness * cos(angle) + thickness]);
    
    length_holder = width / cos(angle);
    
    difference() {
		union() {
			translate([0, 0, height]) {
				rotate([-angle, 0, 0]) {
					cube([z_size, length_holder, thickness]);
				}
			}

			translate([0, 0, height + panel_thickness * cos(angle) + thickness]) {
				rotate([-angle, 0, 0]) {
					cube([z_size, length_holder, thickness]);
				}
			}
		}

		translate([z_size / 2, length_holder / 2, height - length_holder * tan(angle) / 2]) {
			rotate([-angle, 0, 0]) {
				#cylinder(r = hole_radius, h = thickness * 2 + panel_thickness + 2);
			}
		}
	}
}

Holder();

translate([-10, 0, 0]) mirror([1,0,0]) {
    Holder();
}
