class Profile {
  final String name;
  final String firstName;
  final String lastName;
  final String title;
  final String location;
  final String email;
  final String phone;
  final String phoneUri;
  final String linkedin;
  final String resumeAsset;
  final String downloads;
  final String summary;

  const Profile({
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.title,
    required this.location,
    required this.email,
    required this.phone,
    required this.phoneUri,
    required this.linkedin,
    required this.resumeAsset,
    required this.downloads,
    required this.summary,
  });
}

class Stat {
  final String value;
  final String label;

  const Stat(this.value, this.label);
}

class Project {
  final String slug;
  final String title;
  final String role;
  final String tech;
  final String stores;
  final String image;
  final String summary;
  final List<String> points;
  final String? downloads;
  final List<String> screenshots;
  final String? playUrl;
  final String? icon;
  final bool featured;

  const Project({
    required this.slug,
    required this.title,
    required this.role,
    required this.tech,
    required this.stores,
    required this.image,
    required this.summary,
    required this.points,
    this.downloads,
    this.screenshots = const [],
    this.playUrl,
    this.icon,
    this.featured = false,
  });
}

class ExtraProject {
  final String title;
  final String meta;
  final String blurb;
  final String? playUrl;
  final String? icon;

  const ExtraProject({
    required this.title,
    required this.meta,
    required this.blurb,
    this.playUrl,
    this.icon,
  });
}

class Job {
  final String company;
  final String role;
  final String dates;
  final String tenure;
  final List<String> points;

  const Job({
    required this.company,
    required this.role,
    required this.dates,
    required this.tenure,
    required this.points,
  });
}

class SkillGroup {
  final String title;
  final List<String> items;

  const SkillGroup(this.title, this.items);
}

class Education {
  final String degree;
  final String focus;
  final String school;

  const Education({
    required this.degree,
    required this.focus,
    required this.school,
  });
}
