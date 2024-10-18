// ignore: one_member_abstracts
abstract interface class SplashScreenLocalDatasource {
  Future<int?> getImageIndex();
  Future<void> writeImageIndex(int index);
}
