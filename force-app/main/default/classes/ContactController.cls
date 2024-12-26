public class ContactController {
private String sortOrder = 'FirstName';
    
    public List<Contact> getContacts(){
        List<Contact> results = Database.query(
        'SELECT Id , FIRSTName , LastName , Email '+' FROM Contact ' + 
            'ORDER BY '+ sortOrder + ' ASC ' + ' LIMIT 10 '
        );
        return results;
    }
}