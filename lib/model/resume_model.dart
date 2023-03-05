import 'package:resume_builder/model/education_model.dart';
import 'package:resume_builder/model/exprience_model.dart';

import 'project_model.dart';

class ResumeModel {
  ResumeModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.profile,
    required this.objective,
    required this.reference,
    required this.project,
    required this.education,
    required this.experience,
    required this.skills,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final String profile;
  final String objective;
  final String reference;
  final List<Project> project;
  final List<Education> education;
  final List<Experience> experience;
  final List<String> skills;

  factory ResumeModel.fromJson(Map<String, dynamic> json) {
    return ResumeModel(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      mobile: json["mobile"],
      profile: json["profile"],
      objective: json["objective"],
      reference: json["reference"],
      project: json["project"] == null
          ? []
          : List<Project>.from(json["project"].map((x) => Project.fromJson(x))),
      education: json["education"] == null
          ? []
          : List<Education>.from(
              json["education"].map((x) => Education.fromJson(x))),
      experience: json["experience"] == null
          ? []
          : List<Experience>.from(
              json["experience"].map((x) => Experience.fromJson(x))),
      skills: json["skills"] == null
          ? []
          : List<String>.from(json["skills"].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "mobile": mobile,
        "profile": profile,
        "objective": objective,
        "reference": reference,
        "project": List<dynamic>.from(project.map((x) => x.toJson())),
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
        "experience": List<dynamic>.from(experience.map((x) => x.toJson())),
        "skills": List<dynamic>.from(skills.map((x) => x)),
      };
}
