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

  String? jobTitle;
  String? jobSubTitle;
  String? location;
  String? imageUrl;
  String? category;
  String? state;
  String? municipality;
  String? neighborhood;
  String? workingHours;
  String? jobType; // full time /part time

  // 2. Job Information (Second Form)
  String? startDate;
  String? endDate;
  String? workMode;
  String? workSchedule;

  // 3. Employment Details (Third Form)
  String? canStartImmediately;
  String? requiresExperience;
  String? workDays;

  // 4. Salary & Benefits (Fourth Form)
  String? minSalary;
  String? maxSalary;
  String? paymentFrequency;
  String? benefits; // Or use enum if standardized

  // 5. Required Skills (Fifth Form)
  String? softSkills;
  String? technicalSkills;
  String? maxSkillSelections;

  // 6. Position Description (Sixth Form)
  String? jobDescription;

  ///
  ///
  ///
  String? jobPostedTime;
  String? matches;

  JobVacancyModel({
    // Basic Info
    this.imageUrl,
    this.location,
    this.jobTitle,
    this.jobSubTitle,
    this.category,
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
