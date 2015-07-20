trigger contactTaskTrigger on Contact (after insert) {

for (Contact c: Trigger.new)
{
if (c.mailingState == 'CA')
{Task t = new Task();
t.ownerId= c.ownerid;
t.subject ='contact:' +c.lastname;
t.description = 'Donor ID:'+c.id;

insert t;
}
}}