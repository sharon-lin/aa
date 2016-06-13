import java.util.Collections;

int speed = 1; //speed of the movement
int pos = 3;
int amt = 5; //number of pellets
int level = 1;
int temp = amt;
int score = 0; //number of lines
int scene = 0; //Which screen are you on?

ArrayList<Pellets> pelletList = new ArrayList<Pellets>(); //list of pellets
ArrayList<Line> lineList = new ArrayList<Line>(); 

void setup(){
 size (400, 600); //typical size of iPhone screen
 smooth();
 size(400,600);
  background(237,234,221);
  textSize(200);
  fill(0);
  
  PFont roboto;
  roboto = createFont("Roboto-Thin.ttf", 32);
  textFont(roboto);
  text("aa", 150,200); 
  
  noFill();
  roundRect(150,300,100,70);
  text("Play", 150,300);
  
  /*fill(0, 102, 153, 51);
  text("Instructions", 150, 300);
  fill(0, 102, 153, 51);
  text("High Scores", 150, 350);*/ //Ran out of time to implement high score + instructions
 
}

void roundRect(float x, float y, float w, float h)
{
  float corner = w/10.0;
  float midDisp = w/20.0;
  
  beginShape();  
  curveVertex(x+corner,y);
  curveVertex(x+w-corner,y);
  curveVertex(x+w+midDisp,y+h/2.0);
  curveVertex(x+w-corner,y+h);
  curveVertex(x+corner,y+h);
  curveVertex(x-midDisp,y+h/2.0);
  
  curveVertex(x+corner,y);
  curveVertex(x+w-corner,y);
  curveVertex(x+w+midDisp,y+h/2.0);
  endShape();
} 

void draw(){
  
  /*
  *    SCENE 0: MENU SCREEN
  */
  if (scene == 0){
    background(237,234,221);
    textSize(200);
    fill(0);
    
    PFont roboto;
    roboto = createFont("Roboto-Thin.ttf", 302);
    textFont(roboto);
    text("aa", 50,250); 
    
    noFill();
    roundRect(150,300,100,70);
    textSize(35);
    text("Play", 170,350);
    
    /*fill(0, 102, 153, 51);
    text("Instructions", 150, 300);
    fill(0, 102, 153, 51);
    text("High Scores", 150, 350);*/ //Ran out of time to implement high score + instructions
    if (mouseX<=254 && mouseX >= 148 && mouseY <= 365 && mouseY >= 307){
      
      fill(209,195,138);
      roundRect(150,300,100,70);
      fill(0);
      textSize(35);
      text("Play", 170,350);
    
    }
    
  }
  
  /*
  *    SCENE 1: MAIN PLAY STAGE
  */
  else if (scene == 1){
    noStroke(); //no outline
    background(237,234,221); //cream background
    fill(0);
    translate(width/2, height/2); //translates all objects to the center of the screen
    
    int _temp = 0;
    int _temp2;
    
    for (Line i: lineList){
    //  i.appear(_temp);
      _temp++;
      i.rotation();
      
    }
    
    //static center circle
    pushMatrix();
    ellipse(0, 0, 70, 70);
    fill(250);
    textSize(30);
    text(""+level, -12, 8);
    fill(0);
    popMatrix();
    
    //print("Amt: "+amt);
    //template for each new node addition
    pelletList = new ArrayList<Pellets>();
    for (int i=0;i<amt;i++){
      Pellets a = new Pellets(i+1);
      pelletList.add(a);
      a.appear(i+1, amt);
    }
   
    
    speed++;//increments the movement of the nodes around the center circle
    
    /*
    *   IF ALL OF THE PELLETS HAVE FINISHED
    */
    //print ("Pellets: "+pelletList.size());
    if (pelletList.size() == 0){
      scene = 4;
    }
  }
  
  /*
  *    SCENE 2: THE LOSING SCENE - AFTER (sorry for being confusing)
  */
  else if (scene == 2){
    loop();
    background(237,234,221);
    textSize(60);
    fill(255,0,0);
    text("FAIL!", 80,150);
    textSize(40);
    text("Try Again...", 80, 200);
    noFill();
    stroke(0);
    roundRect(90,260,200,50);
    roundRect(90,360,200,50);
    fill(0);
    text("Level "+level, 120, 300);
    text("Continue", 120, 400);

    
    if (mouseX<=287 && mouseX >= 87 && mouseY <= 404 && mouseY >= 367){
      
      fill(209,195,138);
      stroke(0);
      roundRect(90,360,200,50);
      fill(0);
      textSize(40);
      text("Continue", 120, 400);
 
    }

  }
  
  /*
   * SCENE 3 - THE LOSING SCENE - RED OUT
   */
  else if (scene == 3){
   translate(width/2, height/2); 
   noLoop(); 
   
   background(255,0,0);
   pushMatrix();
    ellipse(0, 0, 70, 70);
    fill(250);
    textSize(30);
    text(""+level, -12, 8);
    fill(0);
    popMatrix();
   noLoop();
   rect(0, 0, 1, 1000);

  scene = 2;
  loop();

  }
  
  /*
  *    SCENE 4: WINNER'S SCENE - GREEN OUT
  */
  else if (scene == 4){
   translate(width/2, height/2);
   background(11,212,31);
   pushMatrix();
    ellipse(0, 0, 70, 70);
    fill(250);
    textSize(30);
    text(""+level, -12, 8);
    fill(0);
    popMatrix();
   noLoop();
   
   for (Line i: lineList){
     i.setRectLength(1000);
     i.rotation();
   }
   
   scene = 5;
   loop();
  }
  
  /*
  *    SCENE 5: WINNER'S SCENE - AFTER
  */
  else if (scene == 5){
    
    loop();
    background(237,234,221);
    textSize(60);
    fill(11,212,31);
    text("SUCCESS!", 80,150);
    textSize(40);
    text("NEXT LEVEL...", 80, 200);
    noFill();
    stroke(0);
    roundRect(90,260,200,50);
    roundRect(90,360,200,50);
    fill(0);
    text("Level "+level, 120, 300);
    text("Continue", 120, 400);

    
   // print("MouseX: "+mouseX+" MouseY: "+mouseY);
    
    if (mouseX<=287 && mouseX >= 87 && mouseY <= 404 && mouseY >= 367){
      
      fill(209,195,138);
      stroke(0);
      roundRect(90,360,200,50);
      fill(0);
      textSize(40);
      text("Continue", 120, 400);
    
    }
   
  }
  
  
}

void keyPressed(){
  if (key == CODED) 
     if (keyCode == UP)
       if (amt > 0){
        // Used for testing out necessary coordinates due to disorientation from translations 
        // Note: Do not use translations without proper documentation for future purposes
        //       or push to the global stack without proper documentation.
        
        /* for (int i=0;i<lineList.size();i++){
           print ("Line Y" + i + " : "+lineList.get(i).getY());
         }
         print ("Pellet Y: "+pelletList.get(5).getY());*/
         
         // CHECK IF THE BALL COLLIDES
         for (Line i: lineList){
           if (139 >= (i.getX()-5) && 139 <= (i.getX()+5) && 15 >= (i.getY()-10) && 15 <= (i.getY()+10) ){
             scene = 3;
             break;
           }
                 
         }
         pelletList.remove(amt-1);
         amt--;
         score++;
         Line a = new Line(amt-level-score);
         lineList.add(a);
       }

}

void mousePressed(){
  if (scene == 0){ //Menu Options
   if (mouseX<=254 && mouseX >= 148 && mouseY <= 365 && mouseY >= 307){
      loop();
      scene = 1;
      level++;
      amt = level+4;
      score = 0;
      lineList = new ArrayList<Line>();
      for (int i=1;i<level;i++){
        Line a = new Line(i-1);
        a.setCurrPos(i*43);
        lineList.add(a);
      }
    }
 
  }
  else if (scene == 1){ //Main play screen
    if (mouseX >= -235 && mouseX <= 15 && mouseY >= -80 && mouseY <=120){
      loop();
    }
    else if (mouseX >= -190 && mouseX <= 10 && mouseY >= -200 && mouseY < 0){
        scene = 0;
    }
  }
  else if (scene == 2){ // You LOST screen
  
  //print("MouseX: "+mouseX+" MouseY: "+mouseY);
    if (mouseX<=287 && mouseX >= 87 && mouseY <= 404 && mouseY >= 367){
      scene = 1;
      amt = level+4;
      temp = amt;
      score = 0;
      lineList = new ArrayList<Line>();
      for (int i=1;i<level;i++){
        Line a = new Line(i-1);
        a.setCurrPos(i*43);
        lineList.add(a);
      }
    }
  }
  else if (scene == 5){
    //print("MouseX: "+mouseX+" MouseY: "+mouseY);
    if (mouseX<=287 && mouseX >= 87 && mouseY <= 404 && mouseY >= 367){
      scene = 1;
      scene = 1;
      level++;
      amt = level+4;
      temp = amt;
      score = 0;
      lineList = new ArrayList<Line>();
      for (int i=1;i<level;i++){
        Line a = new Line(i-1);
        a.setCurrPos(i*43);
        lineList.add(a);
      }
    }
  }

}
