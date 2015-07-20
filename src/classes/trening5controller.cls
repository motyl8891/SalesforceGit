public with sharing class trening5controller {

    list<test40__Report__c> cs = test40__Report__c.getall().values();
    public dashboard q{get; set;}
     //q = [select title from dashboard where id='01Z24000000LgwS'];
     List<dashboard> con = [SELECT  Title FROM dashboard WHERE id='01Z24000000LgwS'];

    public String getA() {
        return con[0].title;
    }

}