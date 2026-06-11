public with sharing class AccountController {
  @AuraEnabled(cacheable=true)
  public static List<Account> getAccountsByIds(List<Id> accountIds) {
    return [
      SELECT
        Id,
        Name,
        BillingStreet,
        BillingCity,
        BillingState,
        BillingPostalCode,
        BillingCountry
      FROM Account
      WHERE Id IN :accountIds
      ORDER BY Name
    ];
  }
}