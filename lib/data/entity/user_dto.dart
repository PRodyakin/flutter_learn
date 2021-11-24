/// user : {"status":{"value":"calc","param1":1,"param2":1}}

class UserDto {
  UserDto({
      User? user,}){
    _user = user;
}

  UserDto.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? _user;

  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// status : {"value":"calc","param1":1,"param2":1}

class User {
  User({
      Status? status,}){
    _status = status;
}

  User.fromJson(dynamic json) {
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  Status? _status;

  Status? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    return map;
  }

}

/// value : "calc"
/// param1 : 1
/// param2 : 1

class Status {
  Status({
      String? value, 
      int? param1, 
      int? param2,}){
    _value = value;
    _param1 = param1;
    _param2 = param2;
}

  Status.fromJson(dynamic json) {
    _value = json['value'];
    _param1 = json['param1'];
    _param2 = json['param2'];
  }
  String? _value;
  int? _param1;
  int? _param2;

  String? get value => _value;
  int? get param1 => _param1;
  int? get param2 => _param2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = _value;
    map['param1'] = _param1;
    map['param2'] = _param2;
    return map;
  }

}