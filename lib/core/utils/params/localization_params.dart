class LocalizationParams {
  LocalizationParams({
    required this.param1,
    this.param2,
    this.param3,
    this.param4,
  });

  final String param1;
  final String? param2;
  final String? param3;
  final String? param4;

  String getString() {
    final params = [param1, param2, param3, param4].map((param) => param ?? '');
    return params.join(' ');
  }
}
