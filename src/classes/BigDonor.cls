Public class BigDonor
{
    //constructorkkkxkcvxv
    public BigDonor(String inName)
    {
        Name = inName; 
    }
    
    public String Name
    {
        get {return Name;}
        set {Name = value;}
    } 
    
    public DonorType dType {get; set;}
    
    public Double DonationAmount {get; set;}
}