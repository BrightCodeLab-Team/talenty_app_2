enum UserRole {
  candidate,
  recruiter,
  regulator;

  String get name => toString().split('.').last;
}
