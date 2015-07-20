public class AutomateApprovalRequest2 {
 public static void submitApproval(Id id)
    {
        Approval.ProcessSubmitRequest procReq = new Approval.ProcessSubmitRequest();
        procReq = new Approval.Processsubmitrequest();
        procReq.setComments('Submitting site visit for approval');
        procReq.setObjectId(id);
        Approval.Processresult result = Approval.process(procReq);
        
    }
}