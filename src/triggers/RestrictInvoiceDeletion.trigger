trigger RestrictInvoiceDeletion on test40__Invoice_Statement__c (before delete) {
for (Invoice_Statement__c invoice : 
                    [SELECT Id
                    FROM Invoice_Statement__c
                    WHERE Id IN :Trigger.old]){
        Trigger.oldMap.get(invoice.Id).addError(
                'Cannot delete invoice statement with line items');
    }
}