class RegisterStates{
  final String username;
  final String password;
  final String email;
  final String confirmPassword;

  const RegisterStates(this.username, this.email, this.password, this.confirmPassword);


}
// This is an immutable object and it is thread safe because the immutable object doesn't change their state if OS change the thread