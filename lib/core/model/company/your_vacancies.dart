class VacancyModel {
  String? title;
  String? subtitle;
  String? role;
  String? imageUrl;
  String? description;
  String? startDate;
  String? endDate;
  String? status;
  int? matches;
  String? salaryRange;
  String? location;

  VacancyModel({
    this.title,
    this.role,
    this.subtitle,
    this.imageUrl,
    this.description,
    this.startDate,
    this.endDate,
    this.status,
    this.matches,
    this.salaryRange,
    this.location,
  });
}

// // Enums for type-safe options (recommended)
// enum WorkMode { onSite, hybrid, remote }
// enum WorkSchedule { fullTime, partTime, flexible }
// enum PaymentFrequency { weekly, biweekly, monthly }
// enum WorkDay { mon, tue, wed, thu, fri, sat, sun }

class JobVacancyModel {
  // 1. Basic Information (First Form)

  final String? jobTitle;
  final String? jobSubTitle;
  final String? imageUrl;
  final String? state;
  final String? municipality;
  final String? neighborhood;
  final String? workingHours;
  final String? jobType; // full time /part time

  // 2. Job Information (Second Form)
  final String? startDate;
  final String? endDate;
  final String? workMode;
  final String? workSchedule;

  // 3. Employment Details (Third Form)
  final String? canStartImmediately;
  final String? requiresExperience;
  final String? workDays;

  // 4. Salary & Benefits (Fourth Form)
  final String? minSalary;
  final String? maxSalary;
  final String? paymentFrequency;
  final String? benefits; // Or use enum if standardized

  // 5. Required Skills (Fifth Form)
  final String? softSkills;
  final String? technicalSkills;
  final String? maxSkillSelections;

  // 6. Position Description (Sixth Form)
  final String? jobDescription;
  final String? location;

  ///
  ///
  ///
  final String? jobPostedTime;
  final String? matches;

  const JobVacancyModel({
    // Basic Info
    this.imageUrl,
    this.location,
    this.jobTitle,
    this.jobSubTitle,
    this.state,
    this.municipality,
    this.neighborhood,
    this.workingHours,
    this.jobType,

    // Job Info
    this.startDate,
    this.endDate,
    this.workMode,
    this.workSchedule,

    // Employment Details
    this.canStartImmediately,
    this.requiresExperience,
    this.workDays,

    // Salary & Benefits
    this.minSalary,
    this.maxSalary,
    this.paymentFrequency,
    this.benefits,

    // Skills
    this.softSkills,
    this.technicalSkills,
    this.maxSkillSelections,

    // Description
    this.jobDescription,
    this.jobPostedTime,
    this.matches,
  });

  // Helper Methods
}
