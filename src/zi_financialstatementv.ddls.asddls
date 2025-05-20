@EndUserText.label: 'Financial Statement Version Configuratio'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZI_FinancialStatementV
  as select from ztb_fi_fs_ver_cf
  association to parent ZI_FinancialStatementV_S as _FinancialStatemeAll on $projection.SingletonID = _FinancialStatemeAll.SingletonID
{
      @Consumption.valueHelpDefinition: [{
          entity.name: 'ZI_GLAccountHierarchyVH',
          entity.element: 'GLAccountHierarchy'
      }]
  key fs_ver_cf      as FsVerCf,
  key fs_item        as FsItem,
      is_bold        as IsBold,
      is_nega        as IsNega,
      fs_note        as FsNote,
      fs_item_txt_vn as FsItemTxtVn,
      fs_item_txt_en as FsItemTxtEn,
      fs_hrynode     as FsHrynode,
      @Consumption.hidden: true
      1              as SingletonID,
      _FinancialStatemeAll

}
