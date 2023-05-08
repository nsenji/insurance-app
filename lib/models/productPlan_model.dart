class ProductPlanModel {
  String title = '';
  int id = 1;
  String code = '';
  dynamic description = '';
  dynamic insurer = '';
  dynamic logoUrl = '';
  dynamic currency = '';
  dynamic premiumRate;
  dynamic premiumType = '';
  dynamic coverDuration;
  dynamic partnerCommissionRate;

  ProductPlanModel.fromMap(things) {
    title = things['title'];
    id = things['id'];
    code = things['code'];
    description = things['description'];
    insurer = things['insurer']['name'];
    logoUrl = things['insurer']['logo_url'];
    currency = things['insurer']['currency'];
    premiumRate = things['premium_rate'];
    premiumType = things['premium_type'];
    coverDuration = things['cover_duration'];
    partnerCommissionRate = things['partner_commission_rate'];
  }
}
