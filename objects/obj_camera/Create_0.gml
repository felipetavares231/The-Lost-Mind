// Create a camera
var cam_width = 640;
var cam_height = 360;

global.camera = camera_create_view(0, 0, cam_width, cam_height, 0, -1, -1, 0, 0);
view_camera[0] = global.camera;
view_visible[0] = true;

shake_time = 0;
shake_magnitude = 0;
shake_offset_x = 0;
shake_offset_y = 0;
