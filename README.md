February 25, 2018
Mike Cerruti

## Update Active Employees Backstage Access
Run this Apex in the Execute Anonymous window to update the
employees Access to backstage.

### Constants
The script has three constants that need to be set before
running the script.

*allowAccessOld* boolean value should be opposite
*allowAccessNew* boolean value.

`Boolean allowAccessOld = false;`

`Boolean allowAccessNew = true;`

To test the script before running the update set

`Boolean runUpdate = false;`

The system.asset statement will prevent the Apex from running
on unexpected contact records

`System.assertEquals(contactsSize, contacts.size(), 'Not The Right Number');`

After running in test mode `Boolean runUpdate = false;` Check the debug log to
verify results are accurate.  When satisfied change runUpdate to true.
