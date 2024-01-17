class CoachLoginModel {
  bool? status;
  int? statusCode;
  Data? data;
  String? message;

  CoachLoginModel({this.status, this.statusCode, this.data, this.message});

  CoachLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  User? user;
  bool? isFirstTime;

  Data({this.user, this.isFirstTime});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    isFirstTime = json['isFirstTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['isFirstTime'] = isFirstTime;
    return data;
  }
}

class User {
  String? sId;
  String? userName;
  String? profilePhoto;
  String? coachId;
  String? email;
  String? isPremium;
  String? password;
  String? isSupport;
  String? mobileNumber;
  int? totalClients;
  String? age;
  String? healthMatrix;
  String? otpSms;
  String? otpExpiry;
  List<String>? clients;
  String? lastLogin;
  List<String>? loginDetails;
  String? refreshToken;
  String? joiningDate;
  String? updatedDate;
  int? iV;

  User(
      {this.sId,
        this.userName,
        this.profilePhoto,
        this.coachId,
        this.email,
        this.isPremium,
        this.password,
        this.isSupport,
        this.mobileNumber,
        this.totalClients,
        this.age,
        this.healthMatrix,
        this.otpSms,
        this.otpExpiry,
        this.clients,
        this.lastLogin,
        this.loginDetails,
        this.refreshToken,
        this.joiningDate,
        this.updatedDate,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    profilePhoto = json['profilePhoto'];
    coachId = json['coachId'];
    email = json['email'];
    isPremium = json['isPremium'];
    password = json['password'];
    isSupport = json['isSupport'];
    mobileNumber = json['mobileNumber'];
    totalClients = json['totalClients'];
    age = json['age'];
    healthMatrix = json['healthMatrix'];
    otpSms = json['otpSms'];
    otpExpiry = json['otpExpiry'];
    clients = json['clients'].cast<String>();
    lastLogin = json['lastLogin'];
    loginDetails = json['loginDetails'].cast<String>();
    refreshToken = json['refreshToken'];
    joiningDate = json['joiningDate'];
    updatedDate = json['updatedDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userName'] = userName;
    data['profilePhoto'] = profilePhoto;
    data['coachId'] = coachId;
    data['email'] = email;
    data['isPremium'] = isPremium;
    data['password'] = password;
    data['isSupport'] = isSupport;
    data['mobileNumber'] = mobileNumber;
    data['totalClients'] = totalClients;
    data['age'] = age;
    data['healthMatrix'] = healthMatrix;
    data['otpSms'] = otpSms;
    data['otpExpiry'] = otpExpiry;
    data['clients'] = clients;
    data['lastLogin'] = lastLogin;
    data['loginDetails'] = loginDetails;
    data['refreshToken'] = refreshToken;
    data['joiningDate'] = joiningDate;
    data['updatedDate'] = updatedDate;
    data['__v'] = iV;
    return data;
  }
}
