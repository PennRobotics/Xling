$fn=60;

// OVERALL DIMENSIONS
//   38.4 x 47.4

module create_tabs() {
    for(v = [[ 0.0,  8.8, 1.1],
             [ 0.0, 25.8, 1.1],
             [38.4,  8.8, 1.1],
             [38.4, 25.8, 1.1]])
    {
        minkowski() {
            translate(v) cube([0.3,1.4,0.25]);
            cylinder(h=0.25,r=0.3);
        }
    }
}


module create_pads() {
    for(vv = [[ 4.0,  3.0,  4.00, 13.0],
              [ 4.0,  6.4,  5.75,  6.4],
              [11.5,  5.0, 15.90,  5.0],
              [13.7,  2.8, 13.70,  7.2],
              [14.2, 15.1, 24.20, 15.1],
              [24.7,  2.8, 24.70,  7.2],
              [26.9,  5.0, 22.50,  5.0],
              [34.4,  6.4, 32.64,  6.4],
              [34.4,  3.0, 34.40, 13.0]])
    {
        hull() {
            translate([vv[0],vv[1],1.6]) cylinder(h=0.9,d=1.5);
            translate([vv[2],vv[3],1.6]) cylinder(h=0.9,d=1.5);
        }
    }
}


difference() {
    union() {
        // Case outline
        linear_extrude(1.6) hull() {
            translate([4,4,0]) circle(4);
            translate([34.4,4,0]) circle(4);
            translate([32.4,41.4,0]) circle(6);
            translate([6,41.4,0]) circle(6);
        }
        
        // Screw bosses
        translate([5.75, 43, 0]) cylinder(h=4.75, d=5.5);
        translate([32.65, 43, 0]) cylinder(h=4.75, d=5.5);

        create_tabs();
        create_pads();
    }
    
    // Screen cutout
    translate([3.54, 18.2, -0.2]) cube([31.32, 15.5, 2]);
    translate([1.84, 15.95, 0.8]) cube([35,24,1.0]);
    
    // Screw holes
    // TODO: fix depth and double-check ideal diameter
    translate([5.75, 43, 1.6]) cylinder(h=4, d=1.9);
    translate([32.65, 43, 1.6]) cylinder(h=4, d=1.9);
    
    // Button holes
    translate([10.0, 11.6, -0.2]) cylinder(h=2, d=6.2);
    translate([10.0, 11.6,  0.8]) cylinder(h=1, d=7.8);
    translate([ 8.0, 11.6,  0.8]) cube([4, 5, 1]);
    
    translate([19.2, 10.1, -0.2]) cylinder(h=2, d=6.2);
    translate([19.2, 10.1,  0.8]) cylinder(h=1, d=7.8);
    
    translate([28.4, 11.6, -0.2]) cylinder(h=2, d=6.2);
    translate([28.4, 11.6,  0.8]) cylinder(h=1, d=7.8);
    translate([26.4, 11.6,  0.8]) cube([4, 5, 1]);
}
