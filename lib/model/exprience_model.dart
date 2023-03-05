class Experience {
  Experience({
    required this.companyName,
    required this.jobTitle,
    required this.startDate,
    required this.endDate,
  });

  final String companyName;
  final String jobTitle;
  final String startDate;
  final String endDate;

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        companyName: json["company_name"],
        jobTitle: json["job_title"],
        startDate: json["start_date"],
        endDate: json["end_date"],
      );

  Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "job_title": jobTitle,
        "start_date": startDate,
        "end_date": endDate,
      };
}
