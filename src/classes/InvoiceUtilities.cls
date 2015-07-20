public class InvoiceUtilities { 

   // Class method to renumber Line Items for a given Invoice number. 
   // Returns a string that indicates success or failure. 
   public static String renumberLineItems(String invoiceName) { 

      // Create a copy of the target Invoice object and its Line Items. 
      Invoice__c invoice = 
         [SELECT i.Name 
          FROM Invoice__c i 
          WHERE i.Name = :invoiceName LIMIT 1]; 

      // Loop through each Line Item, renumbering as you go. 
      Integer i = 1; 
     
      // Update the Line Items in one transaction, rollback if any problems 
      // and return error messages to the calling environment. 


      // On success, return a message to the calling program. 
      return 'Line items re-numbered successfully.';   
   }
}