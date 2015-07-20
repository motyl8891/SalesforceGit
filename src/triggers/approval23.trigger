trigger approval23 on Invoice__c (after insert, after update) {
Invoice__c a = trigger.new[0];
    if(a.Status__c == 'Open')
    {
        AutomateApprovalRequest2.submitApproval(a.id);
    }
}