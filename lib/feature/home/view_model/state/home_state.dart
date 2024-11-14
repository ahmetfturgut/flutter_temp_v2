import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

/// Home state
final class HomeState extends Equatable {
  /// Home state constructor
  const HomeState({required this.isLoading, this.users});

  /// Is loading
  final bool isLoading;

  /// Users
  final List<User>? users;

  @override
  List<Object?> get props => [isLoading, users];

  /// Copy with
  HomeState copyWith({bool? isLoading, List<User>? users}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
    );
  }
}
