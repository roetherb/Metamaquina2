// (c) 2013 Felipe C. da S. Sanches <fsanches@metamaquina.com.br>
// Licensed under the terms of the GNU General Public License
// version 3 (or later).

include <Metamaquina2.h>;

module sandwich_test_panel(){
  translate([320, 50])
  XCarriage_sandwich_face();

  translate([440, 50])
  rotate(90)
  XCarriage_bottom_face();

  translate([280, 230])
  XEndMotor_plain_face();

  translate([350, 230])
  XEndIdler_plain_face();

  translate([280, 280])
  XEndMotor_belt_face();

  translate([350, 280])
  XEndIdler_belt_face();

  translate([80, 210])
  XEnd_front_face();

  translate([180, 210])
  mirror([1,0])
  XEnd_front_face();

  translate([80, 280])
  XEndMotor_back_face();

  translate([180, 280])
  XEndIdler_back_face();

  translate([220,140])
  XPlatform_bottom_face();

  translate([85,110])
  set_of_M4_spacers(h=3, w=8);

  translate([200,115])
  set_of_M3_spacers(w=6);

  translate([25,50])
  for (i=[0:5])
    translate([i*45,0]){
      difference(){
        generic_bearing_sandwich_face(H=XPlatform_height, sandwich_tightening = i*2/5);
        rotate(45)
        for (j=[0:i])
        translate([-i/2+j,0]) square([0.3,3]);
      }
    }
  
}

sandwich_test_panel();
