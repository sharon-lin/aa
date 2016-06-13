public class Pellets extends Turnstile{
  int _num;
  float _X = 139;
  float _Y;
  int _temp;
 
  public Pellets(int num){
    _num = num;
    _X = 0;
    _Y = num*3;
  }
  
  public float getX(){
    return _X;
  }
  
  public float getY(){
    return _Y;
  }
  
  public void appear(int order, int position){
    _Y = (200+position*25)-order*25;
    _temp = _num;
    pushMatrix();
    fill(0);
    ellipse(_X,_Y,20,20);
    fill(250);
    textSize(10);
    text(""+_temp+"", _X-6,_Y+6);
    fill(0);
    popMatrix();
  }
  
  public void shoot(){
    if(_temp<=0){
      _X-=20;
    }   
  } 
  
  
}
  
