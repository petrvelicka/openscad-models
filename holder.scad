angle=30;
max_height=40;
solar_panel_size=[200, 200];
thickness=5;
holes_count = 2;
hole_radius = 5;
holes_edge=50;

//this only defines half of the holder according to the printer size (Prusa mini)

module Holder(angle=30, max_height=40, solar_panel_size=[200, 200], thickness=5, holes_count = 2, hole_radius = 5, holes_edge=20) {
    
    height_down = max_height - solar_panel_size[0] * sin(angle);
    
    translate([0, 0, height_down]) {
        cube([solar_panel_size[0], thickness, solar_panel_size[0] * sin(angle)]);
    }
    difference() {
        translate([0, 0, height_down]) {
            cube([solar_panel_size[0], solar_panel_size[1] * cos(angle), thickness]);
        }
           
        holes_distance = (solar_panel_size[0] - 2*holes_edge) / (holes_count - 1);
        for (x = [0:holes_count - 1]) {
            translate([holes_edge + x * holes_distance, max_height / 2, height_down - 1]) {
                
                #cylinder(r = hole_radius, h = thickness + 2);
            }
        }
    }
    
    translate([0, 0, max_height]) {
        rotate([-angle, 0, 0]) { 
            cube([solar_panel_size[0], solar_panel_size[1], 5]);
        }
    }
}

Holder(angle=angle, max_height=max_height, solar_panel_size=solar_panel_size, thickness=thickness, holes_count=holes_count, hole_radius=hole_radius, holes_edge=holes_edge);