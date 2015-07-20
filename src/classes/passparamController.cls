public with sharing class passparamController { 
    public String getContact() {
        return null;
    }

 


    public PageReference MyMethode() {
        if(myinput<myinput2){
                LeftBorder =7- math.abs(myinput.daysBetween(myinput.toStartOfWeek()));
                RightBorder = math.abs(myinput2.daysBetween(myinput2.toStartOfWeek()));
                Center =(myinput.daysBetween(myinput2))-(LeftBorder +RightBorder );
                if(LeftBorder ==0)
                {
                    
                }
                if(LeftBorder !=0)
                {
                    
                }
                //myoutput2 =myinput.daysBetween(myinput2);
                //myinput.toStartOfWeek()-2;
                }
                return null;
    }

    public date myinput2 { get; set; }
    public date myinput { get; set; }
    Public integer myoutput{get;set;}
    Public integer myoutput2{get;set;}
    Public integer leftBorder{get;set;}
    Public integer RightBorder{get;set;}
    Public integer Center{get;set;}

}