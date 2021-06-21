/// id : 11
/// subjectId : 1
/// subjectName : "اللغات الصورية"
/// title : "converting from non deterministic to deterministic"
/// description : "converting-from-non-deterministic-to-deterministic converting-from-non-deterministic-to-deterministic"
/// price : 90000
/// url : "Services Images/9af799f1-d505-4c89-9258-b5376068a7f2%s274px-DFAexample.svg.png"

class ServiceModel {
  int? _id;
  int? _subjectId;
  String? _subjectName;
  String? _title;
  String? _description;
  int? _price;
  String? _url;

  int? get id => _id;
  int? get subjectId => _subjectId;
  String? get subjectName => _subjectName;
  String? get title => _title;
  String? get description => _description;
  int? get price => _price;
  String? get url => _url;

  ServiceModel({
      int? id, 
      int? subjectId, 
      String? subjectName, 
      String? title, 
      String? description, 
      int? price, 
      String? url}){
    _id = id;
    _subjectId = subjectId;
    _subjectName = subjectName;
    _title = title;
    _description = description;
    _price = price;
    _url = url;
}

  ServiceModel.fromJson(dynamic json) {
    _id = json["id"];
    _subjectId = json["subjectId"];
    _subjectName = json["subjectName"];
    _title = json["title"];
    _description = json["description"];
    _price = json["price"];
    _url = json["url"];
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
    return map;
  }

}