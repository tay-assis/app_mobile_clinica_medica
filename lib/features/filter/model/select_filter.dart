class SelectedFilter {
  static final SelectedFilter _instance = SelectedFilter._internal();

  factory SelectedFilter() => _instance;

  SelectedFilter._internal();

  String? specialty;
  String? clinic;
  String? location;
  String? doctorName;
  String? insuranceName;

  void clear() {
    specialty = null;
    clinic = null;
    location = null;
    doctorName = null;
    insuranceName = null;
  }

  bool get hasFilters =>
      specialty != null ||
      clinic != null ||
      location != null ||
      doctorName != null ||
      insuranceName != null;
}
