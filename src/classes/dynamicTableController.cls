public class dynamicTableController {
    Public Integer ColumnNumber {get;set;}

    public dynamicTableController() {
        ColumnNumber = 5;
        Account_List = New list<account>();
      Account_List = [Select name,accountNumber from account limit 5];
      Country_List = New List<string>();
      Country_List.add('India');
      Country_List.add('United Kingdom');
      Country_List.add('United States');
      Country_List.add('Singapore');
      Country_List.add('Spain');
    }
    
    Public List<account> Account_List{get;set;}
   Public List<string> Country_List{get;set;}
     

    
    public String getTableColumnNumber() {
        return String.ValueOf(ColumnNumber );
    }
}