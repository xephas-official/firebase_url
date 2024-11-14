/// all details captured during sign up
class SignUpCredentials {
  /// constructor
  const SignUpCredentials({
    required this.email,
    required this.password,
  });

  /// email
  final String email;

  /// password
  final String password;

  /// from LoginCredentials
  SignUpCredentials.fromLoginCredentials(LoginCredentials loginCredentials)
      : email = loginCredentials.email,
        password = loginCredentials.password;
}

/// * Login Credentials
class LoginCredentials {
  /// [LoginCredentials] constructor
  const LoginCredentials({
    required this.email,
    required this.password,
  });

  /// email
  final String email;

  /// password
  final String password;
}
