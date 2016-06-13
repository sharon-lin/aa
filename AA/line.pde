public class Line extends Turnstile{
  
   int _num;
   float _X;
   float _Y;
   int _temp;
   int _speed;
   int _currPos;
   int _rectLength;
  
  public Line(int num){
    _num = num;
    _X = 0;
    _Y = 0;
    _currPos = frameCount;
    _rectLength = 140;
  }
  
  public void setSpeed(int s){
    _speed = s;
  }
  
  public void setCurrPos(int n){
    _currPos = n;
  }
  
  public void appear(int speed){
    pushMatrix();
    rotate((_num*360)/(2*PI));
    rotate((PI/256)*speed);
    rect(0, 0, 1, 140);
    ellipse(0,140,20,20);
    fill(250);
    text(""+_num+"", 140*cos(PI/256), sin(PI/256));
    fill(0);
    popMatrix();
  }
  
  public int getOrder(){
    return _num;
  }
  
  public int getRectLength(){
    return _rectLength;
  }
  
  public void setRectLength(int n){
    _rectLength = n;
  }
  
  public float getX(){
    return _X;
  }
  
  public float getY(){
    return _Y;
  }
  
  public void rotation(){
    pushMatrix();
    rotate(-_currPos*(PI/256));
    rotate(PI/256);
    rect(0, 0, 1, _rectLength);
    ellipse(0,_rectLength,20,20);
    fill(250);
    textSize(10);
    text(""+_num+"", 140*cos(PI/256), sin(PI/256));
    fill(0);
    popMatrix();
    _X = 140*cos((-_currPos*(PI/256))+(frameCount*(PI/256)));
    _Y = 140*sin((-_currPos*(PI/256))+(frameCount*(PI/256)));
  }
  
}
