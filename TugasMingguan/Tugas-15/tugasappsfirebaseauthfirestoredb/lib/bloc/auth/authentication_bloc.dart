// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';

import '../../models/user.dart';
import '../../services/authentication.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

// class AuthenticationBloc
//     extends Bloc<AuthenticationEvent, AuthenticationState> {
//   final AuthService authService = AuthService();

//   AuthenticationBloc() : super(AuthenticationInitialState()) {
//     on<AuthenticationEvent>((event, emit) {});

//     on<SignUpUser>((event, emit) async {
//       emit(AuthenticationLoadingState(isLoading: true));
//       try {
//         final UserModel? user = await authService.signUpUser(
//             event.email,
//             event.password,
//             event.fullName,
//             event.username,
//             event.address,
//             event.aboutMe);
//         if (user != null) {
//           emit(AuthenticationLoadingState(isLoading: false));
//           emit(AuthenticationSuccessState(user));
//         } else {
//           emit(const AuthenticationFailureState('Create user failed'));
//           print('Error: Create user failed');
//         }
//       } catch (e) {
//         print(e.toString());
//         emit(AuthenticationFailureState(e.toString()));
//       }
//       emit(AuthenticationLoadingState(isLoading: false));
//     });

//     on<SignInUser>((event, emit) async {
//       emit(AuthenticationLoadingState(isLoading: true));
//       try {
//         final UserModel? user =
//             await authService.signInUser(event.email, event.password);
//         if (user != null) {
//           emit(AuthenticationLoadingState(isLoading: false));
//           emit(AuthenticationSuccessState(user));
//         } else {
//           emit(const AuthenticationFailureState('Sign in failed'));
//           print('Error: Sign in failed');
//         }
//       } catch (e) {
//         print(e.toString());
//         emit(AuthenticationFailureState(e.toString()));
//       }
//       emit(AuthenticationLoadingState(isLoading: false));
//     });

//     on<SignOut>((event, emit) async {
//       emit(AuthenticationLoadingState(isLoading: true));
//       try {
//         await authService.signOutUser();
//         emit(AuthenticationInitialState()); // Emit initial state after sign out
//       } catch (e) {
//         print('Error: ${e.toString()}');
//         emit(AuthenticationFailureState(e.toString()));
//       }
//       emit(AuthenticationLoadingState(isLoading: false));
//     });
//   }
// }
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService authService = AuthService();

  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationEvent>((event, emit) {});

    on<SignUpUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        final UserModel? user = await authService.signUpUser(
            event.email,
            event.password,
            event.fullName,
            event.username,
            event.address,
            event.aboutMe);
        if (user != null) {
          emit(AuthenticationLoadingState(isLoading: false));
          emit(AuthenticationSuccessState(user));
        } else {
          emit(const AuthenticationFailureState('Create user failed'));
          print('Error: Create user failed');
        }
      } catch (e) {
        print(e.toString());
        emit(AuthenticationFailureState(e.toString()));
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });

    on<SignInUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        final UserModel? user =
            await authService.signInUser(event.email, event.password);
        if (user != null) {
          emit(AuthenticationLoadingState(isLoading: false));
          emit(AuthenticationSuccessState(user));
        } else {
          emit(const AuthenticationFailureState('Sign in failed'));
          print('Error: Sign in failed');
        }
      } catch (e) {
        print(e.toString());
        emit(AuthenticationFailureState(e.toString()));
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });

    on<SignOut>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        await authService.signOutUser();
        emit(AuthenticationInitialState()); // Emit initial state after sign out
      } catch (e) {
        print('Error: ${e.toString()}');
        emit(AuthenticationFailureState(e.toString()));
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });
  }
}