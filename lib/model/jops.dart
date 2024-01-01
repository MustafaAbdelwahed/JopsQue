class Jops {
  late final int id;
  late final String name;
  late final String image;
  late final String jobTimeType;
  late final String jobType;
  late final String jobLevel;
  late final String jobDescription;
  late final String jobSkill;
  late final String compName;
  late final String compEmail;
  late final String compWebsite;
  late final String aboutComp;
  late final String location;
  late final String salary;
  late final int favorites;
  late final int expired;
  late final String createdAt;
  late final String updatedAt;

  Jops(
      {required this.id,
      required this.name,
      required this.image,
      required this.jobTimeType,
      required this.jobType,
      required this.jobLevel,
      required this.jobDescription,
      required this.jobSkill,
      required this.compName,
      required this.compEmail,
      required this.compWebsite,
      required this.aboutComp,
      required this.location,
      required this.salary,
      required this.favorites,
      required this.expired,
      required this.createdAt,
      required this.updatedAt});

  Jops.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    jobTimeType = json['job_time_type'];
    jobType = json['job_type'];
    jobLevel = json['job_level'];
    jobDescription = json['job_description'];
    jobSkill = json['job_skill'];
    compName = json['comp_name'];
    compEmail = json['comp_email'];
    compWebsite = json['comp_website'];
    aboutComp = json['about_comp'];
    location = json['location'];
    salary = json['salary'];
    favorites = json['favorites'];
    expired = json['expired'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
