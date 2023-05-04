class ProductTypeModel {
  int  id = 1;
  String name = '';
  String slug = '';
  String premiumtype = '';
  dynamic iconurl = '';

  ProductTypeModel.fromMap(things) {
    id = things['id'];
    name = things['name'];
    slug = things['slug'];
    premiumtype = things['premium_type'];
    iconurl = things['icon_url'];
  }
}
