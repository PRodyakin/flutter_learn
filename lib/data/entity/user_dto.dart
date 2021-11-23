/// status : {"value":"reg","settings":{"step":"1"}}

class UserDto {
  UserDto({
      this.status,});

  UserDto.fromJson(dynamic json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  Status? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (status != null) {
      map['status'] = status?.toJson();
    }
    return map;
  }

}

/// value : "reg"
/// settings : {"step":"1"}

class Status {
  Status({
      this.value, 
      this.settings,});

  Status.fromJson(dynamic json) {
    value = json['value'];
    settings = json['settings'] != null ? Settings.fromJson(json['settings']) : null;
  }
  String? value;
  Settings? settings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    if (settings != null) {
      map['settings'] = settings?.toJson();
    }
    return map;
  }

}

/// step : "1"

class Settings {
  Settings({
      this.step,});

  Settings.fromJson(dynamic json) {
    step = json['step'];
  }
  String? step;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['step'] = step;
    return map;
  }

}