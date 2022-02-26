class LanguageModel {
  late final String ar;
  late final String en;

  LanguageModel({
    required this.ar,
    required this.en,
});

  LanguageModel.fromMap(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    return {
      'ar': ar,
      'en': en,
    };
  }
}