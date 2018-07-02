public class Ligne extends Component{
private String sentence="" ;
private int tailleP;
private int numL;
private PFont font ;

public Ligne(String s,int tailleP,int numLigne){
  sentence = s;
  this.tailleP=tailleP;
  font = createFont("Lucida Console",tailleP);

  numL = numLigne; 
}
@Override
public void aff(){
  fill(255,255,255);
  textFont(font,tailleP);
  //textSize(tailleP);
  text(sentence,(int)(width*0.02),height-(tailleP*numL));
}

public void addLetter(char l){
  if(sentence.length()+1<(width-(int)(0.02*width))/(0.6*tailleP))
    sentence+=l;
}
public void removeLetter(int pos){
  String temp="";
  for (int i = 0 ; i<sentence.length();i++)
  {
    if(i!=pos)  temp+=sentence.charAt(i);
    
  }
    sentence = temp;
  }
  public void enter()
  {
    sentence="";
  }
  public String getStr(){
    return sentence;
  }
}
public class ArchLigne   {
  private String str;
  private PFont font ;
  private int taille;
  
  public ArchLigne(String l,int tailleP){
  str=l;
  font = createFont("Lucida Console",tailleP);
  taille = tailleP;
}
  
public void aff(int pos){
  fill(255,255,255);
  textFont(font,taille);
  //textSize(tailleP);
  text(str,(int)(width*0.02),height-(3.5*taille)-taille*pos);
}
}
