// Scenario 1 Before Insert: If Account industry is not null and having value as Media then populate rating as Hot 
// Scenario 2 After Insert: Create related opportunity when Account is created
//
public class AccountTrigger1Handler {
    public static void updateRating(List<Account> newList){
        for(Account acc: newList){
            if(acc.Industry !=null && acc.Industry=='Media'){
                acc.Rating='Hot';
            }  
        }
    }
    public static void createRelatedOpp(List<Account> newList){
        List<Opportunity> oppToBeInserted = new List<Opportunity>();
        
        for(Account acc : newList){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.AccountId = acc.Id;
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.today();
            oppToBeInserted.add(opp);
        }
        if(!oppToBeInserted.isEmpty()){
            insert oppToBeInserted;
        }
    }
}