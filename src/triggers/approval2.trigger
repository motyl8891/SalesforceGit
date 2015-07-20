trigger approval2 on test40__A__c (after insert, after update) {
A__c a = trigger.new[0];
    if(a.Status__c == 'Pending')
    {
        AutomateApprovalRequest2.submitApproval(a.id);
    }
}