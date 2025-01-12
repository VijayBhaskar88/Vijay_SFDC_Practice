trigger AccountTrigger1 on Account (before insert, after insert) {
    if(Trigger.isInsert){
    	if(Trigger.isBefore){
    		AccountTrigger1Handler.updateRating(Trigger.new);
        }else if(Trigger.isAfter) {
            AccountTrigger1Handler.createRelatedOpp(Trigger.new);

        }
    }
    
}