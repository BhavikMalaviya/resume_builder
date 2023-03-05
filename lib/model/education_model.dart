class Education {
  Education({
    required this.courseDegree,
    required this.schoolUniversity,
    required this.gradeScore,
    required this.year,
  });

  final String courseDegree;
  final String schoolUniversity;
  final String gradeScore;
  final String year;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        courseDegree: json["course_degree"],
        schoolUniversity: json["school_university"],
        gradeScore: json["grade_score"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "course_degree": courseDegree,
        "school_university": schoolUniversity,
        "grade_score": gradeScore,
        "year": year,
      };
}
