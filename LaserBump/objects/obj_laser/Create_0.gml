/// @description Init
BounceCounter = 1
StartX = x
StartY = y

StartingInWall = true
IsBouncing = false

SetDestroying = false

LastX = x
LastY = y

//ParticleSystem
part_sys = part_system_create();
part_system_depth(part_sys,self.depth+5);


// Particle
partStandard = part_type_create();
part_type_shape(partStandard,pt_shape_sphere);
part_type_scale(partStandard,1,1);
part_type_size(partStandard,0.5,0.7,-0.005,0);
part_type_colour2(partStandard,c_aqua,c_white);
part_type_alpha2(partStandard,1,0.75);
part_type_speed(partStandard,0.1,0.10,0,0);
part_type_direction(partStandard,0,250,0,0);
part_type_gravity(partStandard,0.009,image_angle);
part_type_life(partStandard,room_speed*2,room_speed*4);


//Paticle Emitter
part_emit = part_emitter_create(part_sys);
part_emitter_region(part_sys,part_emit,x-15,x+15,y-15,y+15,ps_shape_line,ps_distr_gaussian);
part_emitter_stream(part_sys,part_emit,partStandard,3);