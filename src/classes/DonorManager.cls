public class DonorManager
{
    private Integer m_DonorCount;
    
    public Integer DonorCount 
    {
        get{return m_DonorCount;}
        set{m_DonorCount = value;}
    }
    
    public final Double Threshold = 500;
    
    public BigDonor RetrieveBigDonor()
    {
        BigDonor d = new BigDonor('Richard');
        d.Name = 'Richard';
        d.dType = DonorType.Individual;
        d.DonationAmount = 300;
    
        return d;      
    }
    public string CreateArray()
    {
        string[] sArr = new String[3];
        sArr[0] = 'Hallo Array';
        string s = string.valueof(sArr.size());
        return s;

    }
    public string CreateList()
    {
        List<BigDonor> donors = new List<BigDonor>();
        BigDonor d1 = new BigDonor('Aaron');
        donors.add(d1);

        BigDonor d2 = new BigDonor('Fritz');
        donors.add(d2);

        string s = string.valueof(donors.size());
        donors.remove(0);
        return s;
    }
    public string CreateSet()
    {
        Set <candidate__c> candidates = new Set <candidate__c>();
        
        candidate__c c1 = new candidate__c();
        c1.Name = 'Aaron';
        candidates.add(c1);

        candidate__c c2 = new candidate__c();
        c1.Name = 'Fritz';
        candidates.add(c2);

        String s = String.valueof(candidates.size());

        return s;
            }

    public string CreateMap()
    {
        Map<string,BigDonor> donorMap = new Map <string,BigDonor>();
        BigDonor d1 = new BigDonor('Richard');
        d1.dType= DonorType.Individual;
        d1.DonationAmount = 200;
        donorMap.put('RS', d1);
    
        BigDonor d2 = new BigDonor('Megan');
        d2.dType= DonorType.Individual;
        d2.DonationAmount = 200;
        donorMap.put('MR', d2);

        string s = string.valueof(donorMap.values().size());
        return s;
    }
    
    public string CreateCandidateList()
    {
        List <candidate__c> candidates = new List <candidate__c>();
        
        candidate__c c1 = new candidate__c();
        c1.Name = 'Aaron';
        c1.HomeTown__c = 'Seatle';
        candidates.add(c1);

        candidate__c c2 = new candidate__c();
        c2.Name = 'Fritz';
        c2.HomeTown__c = 'New Jersey';
        candidates.add(c2);
		
        try
        {
            insert candidates;
        }
        catch(DmlException e1)
        {
            
        }
        
        
        for(candidate__c c3:candidates)
        {
            
            c3.HomeTown__c = 'Semi Valley'; 
        }

        database.SaveResult[] resoults = database.update(candidates,false);
        String s = String.valueof(candidates.size());

        return s;
            }
    public void DeleteCandidates()
    {
        candidate__c[] candidates = [SELECT Id, Name FROM Candidate__c  ];
            delete candidates;
    }
}