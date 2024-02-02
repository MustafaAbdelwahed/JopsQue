class Company {
  int? id;
  String? name;
  String? image;
  String? email;
  String? website;
  String? about;
  String? location;
  String? createdAt;
  String? updatedAt;
  String? bl;

  Company({
    this.id,
    this.name,
    this.image,
    this.email,
    this.website,
    this.about,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.bl,
  });

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    website = json['website'];
    about = json['about'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['image'] = this.image;
  //   data['email'] = this.email;
  //   data['website'] = this.website;
  //   data['about'] = this.about;
  //   data['location'] = this.location;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }
}
