class UserDetails {
  String uid = '';
  String email = '';
  String mobileNo = '';
  String name = '';
  String address = '';

  UserDetails();

  UserDetails.fromEmail(
    String uid,
    String email,
    String mobileNo,
    String name,
    String address,
  ) {
    this.uid = uid;
    this.email = email;
    this.mobileNo = mobileNo;
    this.name = name;
    this.address = address;
  }
}
