$fn = 120;



vNoOfBlades = 5;
vAngleIncrement = 360/vNoOfBlades;

vBladeThickness = 2;

vBladeAxis_d = 4;
vBladeAxisEye = 10;
vBladeAxisCircle = 60;
vBladeBase_d = vBladeAxisCircle;
vBladeBase_d1 = vBladeAxisCircle+vBladeThickness;
vBladeBase_d2 = vBladeAxisCircle-vBladeThickness;
vBladeOuter_d = vBladeAxisCircle + vBladeAxisEye;

vBladePin_d = 4;
vBladePin_h = 2*vBladeThickness;

vBladeOffset = vBladeAxisCircle/2;



intersection(){
    difference(){
        union(){
            // base half circle
            difference(){
                translate([vBladeOffset, 0, 0])
                    //cylinder(d=vBladeBase_d, h=vBladeThickness);
                    cylinder(d1=vBladeBase_d1, d2=vBladeBase_d2, h=vBladeThickness);
                translate([vBladeAxisEye,0,0])
                    cube([vBladeBase_d, vBladeBase_d/2, vBladeThickness]);
                }
            // adding a bit to the half circle
            translate([vBladeAxisEye,0,0])
                cube([vBladeBase_d/2-vBladeAxisEye, vBladeAxisEye/2, vBladeThickness]);
            // adding the final axis eye
            translate([vBladeOffset, 0, 0])
                cylinder(d=vBladeAxisEye, h=vBladeThickness);
            }
        // axis hole
        translate([vBladeOffset, 0, 0])
            cylinder(d=vBladeAxis_d, h=vBladeThickness);
        
        // cutoff from next blade
        rotate([0,0, vAngleIncrement])
            translate([vBladeOffset, 0, 0])
                //cylinder(d=vBladeBase_d, h=vBladeThickness);
                cylinder(d1=vBladeBase_d1, d2=vBladeBase_d2, h=vBladeThickness);
        
    }
    cylinder(d=vBladeOuter_d, h=vBladeThickness);
}

// blade pin
rotate([0,0,-12])
    translate([vBladeOffset, 0, 0])
        cylinder(d=vBladePin_d, h=vBladePin_h);