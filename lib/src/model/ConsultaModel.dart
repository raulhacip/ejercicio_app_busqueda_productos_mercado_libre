class ConsultaModel {
  String siteId = '';
  String countryDefaultTimeZone = '';
  String query = '';
  Paging? paging;
  List<Results>? results;

  ConsultaModel(
      {required this.siteId,
      required this.countryDefaultTimeZone,
      required this.query,
      required this.paging,
      this.results});

  ConsultaModel.fromJson(Map<String, dynamic> json) {
    this.siteId = json['site_id'];
    this.countryDefaultTimeZone = json['country_default_time_zone'];
    this.query = json['query'];
    paging =
        (json['paging'] != null ? new Paging.fromJson(json['paging']) : null)!;
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['site_id'] = this.siteId;
    data['country_default_time_zone'] = this.countryDefaultTimeZone;
    data['query'] = this.query;
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paging {
  int? total;
  int? primaryResults;
  int? offset;
  int? limit;

  Paging({this.total, this.primaryResults, this.offset, this.limit});

  Paging.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    primaryResults = json['primary_results'];
    offset = json['offset'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['primary_results'] = this.primaryResults;
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    return data;
  }
}

class Results {
  String id = '';
  String siteId = '';
  String title = '';
  int price = 0;
  Null? salePrice;
  String? currencyId;
  int? availableQuantity;
  int? soldQuantity;
  String? buyingMode;
  String? listingTypeId;
  String? stopTime;
  String? condition;
  String? permalink;
  String? thumbnail;
  String? thumbnailId;
  bool? acceptsMercadopago;

  Results(
      {required this.id,
      required this.siteId,
      required this.title,
      required this.price,
      this.salePrice,
      this.currencyId,
      this.availableQuantity,
      this.soldQuantity,
      this.buyingMode,
      this.listingTypeId,
      this.stopTime,
      this.condition,
      this.permalink,
      this.thumbnail,
      this.thumbnailId,
      this.acceptsMercadopago});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteId = json['site_id'];
    title = json['title'];
    price = json['price'];
    salePrice = json['sale_price'];
    currencyId = json['currency_id'];
    availableQuantity = json['available_quantity'];
    soldQuantity = json['sold_quantity'];
    buyingMode = json['buying_mode'];
    listingTypeId = json['listing_type_id'];
    stopTime = json['stop_time'];
    condition = json['condition'];
    permalink = json['permalink'];
    thumbnail = json['thumbnail'];
    thumbnailId = json['thumbnail_id'];
    acceptsMercadopago = json['accepts_mercadopago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['site_id'] = this.siteId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['sale_price'] = this.salePrice;
    data['currency_id'] = this.currencyId;
    data['available_quantity'] = this.availableQuantity;
    data['sold_quantity'] = this.soldQuantity;
    data['buying_mode'] = this.buyingMode;
    data['listing_type_id'] = this.listingTypeId;
    data['stop_time'] = this.stopTime;
    data['condition'] = this.condition;
    data['permalink'] = this.permalink;
    data['thumbnail'] = this.thumbnail;
    data['thumbnail_id'] = this.thumbnailId;
    data['accepts_mercadopago'] = this.acceptsMercadopago;
    return data;
  }
}
