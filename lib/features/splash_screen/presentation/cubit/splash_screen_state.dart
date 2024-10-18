part of 'splash_screen_cubit.dart';

class SplashScreenState extends Equatable {
  const SplashScreenState({
    required this.imagePath,
  });

  final String imagePath;

  @override
  List<Object> get props => [imagePath];

  SplashScreenState copyWith({
    String? imagePath,
  }) {
    return SplashScreenState(
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
