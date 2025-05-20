@AbapCatalog.sqlViewName: 'ZSQL_GLAHVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'GL Account Hierarchy Value Help'
define view ZI_GLAccountHierarchyVH
  as select from I_GLAccountHierarchy
    inner join   I_GLAccountHierarchyText on  I_GLAccountHierarchyText.GLAccountHierarchy = I_GLAccountHierarchy.GLAccountHierarchy
                                          and I_GLAccountHierarchyText.ValidityEndDate    = I_GLAccountHierarchy.ValidityEndDate
                                          and I_GLAccountHierarchyText.Language           = $session.system_language
{
  key I_GLAccountHierarchy.GLAccountHierarchy, 
      I_GLAccountHierarchy.ChartOfAccounts,
      I_GLAccountHierarchyText.GLAccountHierarchyName
}

where I_GLAccountHierarchy.SemanticTagIsUsed = 'X'
