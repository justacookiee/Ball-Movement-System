class Ball {
  PVector inp, inpVel, pos, vel;
  float k1, k2, k3;
  boolean init;
  Ball(float inpx, float inpy, float f, float z, float r) {
    inp = new PVector(inpx, inpy);
    pos = new PVector(inpx, inpy);
    vel = new PVector(0, 0);
    inpVel = new PVector(0, 0);
    init = true;
    
    k1 = z / (PI * f);
    k2 = 1 / (2 * PI * f * 2 * PI * f);
    k3 = r * z / (2 * PI * f);
    
  }
  PVector update(PVector newInp, float T) {
    
    if(init) {
      inpVel.x = (newInp.x - inp.x) / T;
      inpVel.y = (newInp.y - inp.y) / T;
      init = false;
    }
    
    pos.x += T * vel.x;
    pos.y += T * vel.y;
    
    vel.x += T * (newInp.x + k3 * inpVel.x - pos.x - k1 * vel.x) / k2;
    vel.y += T * (newInp.y + k3 * inpVel.y - pos.y - k1 * vel.y) / k2;
    return pos;
  }
}
