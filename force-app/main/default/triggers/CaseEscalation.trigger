trigger CaseEscalation on Case (after update) {
    Map<Id, Integer> accountEscalationMap = new Map<Id, Integer>();

    for (Case c : Trigger.new) {
        Case oldCase = Trigger.oldMap.get(c.Id);

        // Only process if status changed to 'Escalated'
        if (c.Status == 'Escalated' && oldCase.Status != 'Escalated' && c.AccountId != null) {
            if (accountEscalationMap.containsKey(c.AccountId)) {
                accountEscalationMap.put(c.AccountId, accountEscalationMap.get(c.AccountId) + 1);
            } else {
                accountEscalationMap.put(c.AccountId, 1);
            }
        }
    }

    List<Account> accountsToUpdate = [SELECT Id, Total_Escalations__c FROM Account WHERE Id IN :accountEscalationMap.keySet()];

    for (Account acc : accountsToUpdate) {
        Integer currentCount = acc.Total_Escalations__c == null ? 0 : Integer.valueOf(acc.Total_Escalations__c);
        acc.Total_Escalations__c = currentCount + accountEscalationMap.get(acc.Id);
    }

    if (!accountsToUpdate.isEmpty()) {
        update accountsToUpdate;
    }
}