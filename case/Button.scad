$fn=60;

union() {
    rotate_extrude() union(){
        translate([   0, 2.15, 0]) square([1.85, 0.75], center=false);
        translate([   0, 1.20, 0]) square([2.60, 0.95], center=false);
        translate([1.85, 2.15, 0]) circle(0.75);
        translate([   0, 0.80, 0]) square([3.10, 0.40], center=false);
    }
    cylinder(0.8, 0.75, 1.35);
}
