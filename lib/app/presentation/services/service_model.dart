/// id : 11
/// subjectId : 1
/// subjectName : "Logate_Sowarya"
/// title : "تحويل من أتومات منتهي لا حتمي إلى حتمي"
/// description : "أداة تقوم بتحويل الأتومات المنتهي اللاحتمي إلى حتمي وفقاً لدخل معين وبشكل ديناميكي"
/// price : 90000
/// url : "Services Images/9af799f1-d505-4c89-9258-b5376068a7f2%s274px-DFAexample.svg.png"
/// route : "converting from non deterministic to deterministic"
/// isActivated : false

class ServiceModel {
  dynamic _id;
  dynamic? _subjectId;
  dynamic? _subjectName;
  dynamic? _title;
  dynamic? _description;
  dynamic? _price;
  dynamic? _url;
  dynamic? _route;
  dynamic? _isActivated;

  dynamic? get id => _id;
  dynamic? get subjectId => _subjectId;
  dynamic? get subjectName => _subjectName;
  dynamic? get title => _title;
  dynamic? get description => _description;
  dynamic? get price => _price;
  dynamic? get url => _url;
  dynamic? get route => _route;
  dynamic? get isActivated => _isActivated;

  ServiceModel({
    dynamic? id,
    dynamic? subjectId,
    dynamic? subjectName,
    dynamic? title,
    dynamic? description,
    dynamic? price,
    dynamic? url,
    dynamic? route,
    dynamic? isActivated}){
    _id = id;
    _subjectId = subjectId;
    _subjectName = subjectName;
    _title = title;
    _description = description;
    _price = price;
    _url = url;
    _route = route;
    _isActivated = isActivated;
}

  ServiceModel.fromJson(dynamic json) {
    _id = json["id"];
    _subjectId = json["subjectId"];
    _subjectName = json["subjectName"];
    _title = json["title"];
    _description = json["description"];
    _price = json["price"];
    _url = json["url"];
    _route = json["route"];
    _isActivated = json["isActivated"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["subjectId"] = _subjectId;
    map["subjectName"] = _subjectName;
    map["title"] = _title;
    map["description"] = _description;
    map["price"] = _price;
    map["url"] = _url;
    map["route"] = _route;
    map["isActivated"] = _isActivated;
    return map;
  }

}