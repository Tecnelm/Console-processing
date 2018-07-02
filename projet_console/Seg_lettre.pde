/*
cette class servira à montrer ou le courseur de texte sera et le faire clignoter*/ 

public class Seg_lettre extends Component{
  private int tailleP,tailleh=4;
  private int pos = 0,posy=height-(int)(height*0.025);
  private int periode;
  private boolean aff =false;
  public Seg_lettre(int taillepolice,int pos,float freq)
  {
    tailleP = taillepolice;
    this.pos=pos;
    this.posy=posy;
    periode = (int)(((float)1/freq)*(float)1000);
    Thread clign = new Thread(new Runnable(){// realisation du clignotement dans une boucle à pars pour avoir la frequence voulu
      public void run()
      { 
        while(true)
        {
          aff = aff?false:true;//inverse un bolean qui renseignera si il faut ou non afficher le rectangle de la console
          delay(periode);//attend un certain temps avec d'inverser a nouveau
        }
      }
    });
    clign.start();
  }
  @Override
  public void aff(){
    if(aff){
      fill(255,255,255);
      
      // rect((int)(width*0.02)+(int)(tailleP*0.6)*pos,posy,(int)(tailleP*0.6),tailleh); 
       rect((int)(width*0.02)+tailleP*0.6*pos,height-(2*tailleP),2,tailleP); 
      
    }
  }
  
  
  public void addPos(){
    if(pos+1< (width-0.02*width)/(0.6*tailleP))
    this.pos++;
  }
  public void backPos(){
    this.pos--;
  }
  public void resetPos(){
    this.pos=0;
  }
  public int getPos()
  { 
    return pos;
  }
  
}
