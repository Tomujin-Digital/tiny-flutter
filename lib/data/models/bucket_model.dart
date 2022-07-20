class BucketModel {
  int? count;
  List<Files>? files;

  BucketModel({this.count, this.files});

  BucketModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(Files.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = count;
    if (files != null) {
      data['files'] = files!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Files {
  String? key;
  String? lastModified;
  String? eTag;

  Files({this.key, this.lastModified, this.eTag});

  Files.fromJson(Map<String, dynamic> json) {
    key = json['Key'];
    lastModified = json['LastModified'];
    eTag = json['ETag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Key'] = key;
    data['LastModified'] = lastModified;
    data['ETag'] = eTag;
    return data;
  }
}
