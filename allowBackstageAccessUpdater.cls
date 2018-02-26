/** Run this script to update Backstage Access to Active Contacts. **/

/**
 * Constants
 * allowAccessOld boolean value should be opposite
 * allowAccessNew boolean value
 */

Boolean allowAccessOld = false;
Boolean allowAccessNew = true;
Boolean runUpdate = true;

List<Contact> testSize = new List<Contact>(
  [
    SELECT Id,
        Allow_Access_Backstage__c,
        Name
    FROM Contact
    WHERE RecordType.Name = 'SIS Employee'
        AND Employment_Status__c = 'Active'
        AND Allow_Access_Backstage__c = :allowAccessOld
        AND System_Account__c = false
  ]
);

Integer contactsSize = testSize.size();

System.assertNotEquals(0, contactsSize, 'Size = 0');

if(contactsSize > 0) {
  List<Contact> contacts = new List<Contact> (
    [
      SELECT Id,
          Allow_Access_Backstage__c,
          Employee_Number__c,
          Name
      FROM Contact
      WHERE RecordType.Name = 'SIS Employee'
          AND Employment_Status__c = 'Active'
          AND Allow_Access_Backstage__c = :allowAccessOld
          AND System_Account__c = false
    ]
  );

    System.assertEquals(contactsSize, contacts.size(), 'Not The Right Number');

    List<Contact> contactsToUpdate = new List<Contact> ();
    
      for (Contact c : contacts) {
        c.Allow_Access_Backstage__c = allowAccessNew;
        contactsToUpdate.add(c);
        System.debug(
            'Contact: ' + contactsToUpdate.size() +
            ' Employee: ' + c.Employee_Number__c +
            ' ' + c.Name
        );
      }

    if(runUpdate) {
      update contactsToUpdate;
    }
}
