class Console{
  
  private int width,height;
  private int taillepolice;
  private int nbLigne;
  private ArrayList<ArchLigne> ligneL = new ArrayList<ArchLigne>();
  private ArrayList<Component>com = new ArrayList<Component>();
  private Seg_lettre segment;
  private Ligne ligneEcr;
  private int numMax;
  private int posMonte=0;
  
 
  public Console(int width,int height,int tailleP){
    this.width = width;
    this.height = height;
    taillepolice=tailleP;
    nbLigne=((height-3*taillepolice)/taillepolice);
  } 
  public void settings(){
  size(width,height);
}
  public void setup(){
    segment=new Seg_lettre(taillepolice,0,1.9);
    com.add(segment);
    ligneEcr = new Ligne("",taillepolice,1);
    com.add(ligneEcr);
    
    com.add(new Contour(width,height,taillepolice));
    background(15,15,15);
    
     
  }
  public void draw(){
    background(15,15,15);
    for(Component c : com)
      c.aff();
    numMax = ligneL.size()<=nbLigne ? 0 :(ligneL.size()-nbLigne-posMonte)>=0? (ligneL.size()-nbLigne-posMonte):0 ;
    int posi = 0;
    for(int i =ligneL.size()-1-posMonte ;i>=numMax;i--)
    {
      ligneL.get(i).aff(posi);
      posi++;
    }
      
  }
  
  public void print(String str)
  {
    ligneL.add(new ArchLigne(str,taillepolice));
  }
  public void keyPressed(int keycode,char Key){
    
      if(Key>=' ' && Key<=126){
         segment.addPos();      
         ligneEcr.addLetter(key);
      }
      else
        {
          switch(keycode){
            case BACKSPACE:
              if(segment.getPos()>0){
                ligneEcr.removeLetter(segment.getPos()-1); 
                segment.backPos();}
              break;
            case ENTER:
              ligneL.add(new ArchLigne(ligneEcr.getStr(),taillepolice));
              ligneEcr.enter();
              segment.resetPos();
              posMonte = 0;
              break;
           case UP : posMonte = ligneL.size()>=nbLigne ? ligneL.size()-1-posMonte >0? posMonte+1: posMonte:posMonte; break;
           case DOWN : posMonte = posMonte>0 ? posMonte -1:posMonte; break;
          }
      }
  }
}     
