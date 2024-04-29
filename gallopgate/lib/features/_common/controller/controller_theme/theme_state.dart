part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState._(this.theme);

  final ThemeMode theme;

  @override
  List<Object?> get props => [theme];

  factory ThemeState.initial(ThemeMode? initialTheme) =>
      ThemeState._(initialTheme ?? ThemeMode.system);
}
