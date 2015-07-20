public with sharing class TestController {

    public Summary[] Summaries { get; set; }

    public TestController() {
        AggregateResult[] results = [
            SELECT Name, Count(Id) Quantity FROM Opportunity GROUP BY Name
        ];
        Summaries = new List<Summary>();
        for (AggregateResult ar : results) {
            Summaries.add(new Summary(ar));
        }
    }

    // wrapper class to hold aggregate data
    public class Summary {
        public Integer Quantity { get; private set; }
        public String Name { get; private set; }
        public Integer Cid { get; private set; }
        
        public Summary(AggregateResult ar) {
            Quantity = (Integer) ar.get('Quantity');
            Name = (String) ar.get('Name');
           
        }
    }

}