//
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
//
//
// import '../../utils/loaders & dialogs/loaders.dart';
//
//
// class ExceptionHandler{
//   void handleFirebaseLoginErrors(var error) {
//     switch (error.toString()) {
//       case 'invalid-credential':
//         if (kDebugMode) {
//           print('The credential provided is invalid.');
//         }
//         Utils.snackBar("Invalid Credentials", "invalid_credentials".tr);
//         break;
//       case 'too-many-requests':
//         if (kDebugMode) {
//           print('The user has exceeded the number of allowed requests per second.');
//         }
//         hideLoadingDialog();
//         Utils.snackBar("Server Down", "server_exception".tr);
//         break;
//       case 'network-error':
//         if (kDebugMode) {
//           print('A network error has occurred.');
//         }
//         InternetException("");
//         Utils.snackBar("NO Internet", "Check Your Internet Collections");
//         break;
//       case 'operation-not-allowed':
//         if (kDebugMode) {
//           print('The operation is not allowed.');}
//           Utils.snackBar("Error", "Please Retry");
//
//         break;
//       case 'invalid-verification-code':
//         if (kDebugMode) {
//           print('The verification code provided is incorrect.');
//         }
//         Utils.snackBar("Wrong OTP", "Sorry Wrong OTP need to try again".tr);
//         break;
//       case 'verification-code-expired':
//         if (kDebugMode) {
//           print('The verification code has expired.');}
//           Utils.snackBar("Otp Expired", "This otp is expired, Please resend it!!");
//
//         break;
//       case 'phone-number-not-verified':
//         if (kDebugMode) {
//           print('The phone number has not been verified.');}
//           Utils.snackBar("Not valid", "Your phone number is not verified retry login");
//         break;
//       case 'invalid-phone-number':
//         if (kDebugMode) {
//           print('The phone number is invalid.');}
//           Utils.snackBar("Not valid", "Invalid phone number, try with another one");
//
//         break;
//       case 'unsupported-country':
//         if (kDebugMode) {
//           print('The country code is not supported.');}
//           Utils.snackBar("Unsupported Country", "You are trying with not supported country code");
//
//         break;
//       case 'requires-recent-login':
//         if (kDebugMode) {
//           print('The user\'s last sign-in time does not meet the security threshold.');}
//           Utils.snackBar("Error", "Please Retry");
//
//         break;
//       case 'admin-restricted-operation':
//         if (kDebugMode) {
//           print('This operation is restricted to administrators only.');
//           Utils.snackBar("Error", "Please Retry");
//         }
//         break;
//       case 'argument-error':
//         if (kDebugMode) {
//           print('An error occurred due to incorrect arguments being passed to a method.');
//         }
//         Utils.snackBar("Error", "Please Retry");
//         break;
//       case '[firebase_auth/invalid-verification-code] The verification code from SMS/TOTP is invalid. Please check and enter the correct verification code again.':
//         if (kDebugMode) {
//           print(error);
//         }
//         Utils.snackBar("Invalid Otp", "Please Try with another otp.");
//         break;
//       case 'app-not-authorized':
//         if (kDebugMode) {
//           print(
//               'This app, identified by the domain where it\'s hosted, is not authorized to use Firebase Authentication with the provided API key.');
//         }
//           Utils.snackBar("Server Down", "server_exception".tr);
//
//         break;
//       case 'invalid-tenant-id':
//         if (kDebugMode) {
//           print('The tenant ID provided is invalid.');
//         }
//           Utils.snackBar("Error", "Please Retry");
//
//         break;
//       case 'app-deleted':
//         if (kDebugMode) {
//           print('The instance of FirebaseApp has been deleted.');
//         }
//           Utils.snackBar("Server Down", "server_exception".tr);
//
//         break;
//       case 'sign_in_failed':
//         if (kDebugMode) {
//           print('Sign in with Google failed.');
//         }
//           Utils.snackBar("Error", "Please Retry");
//
//         break;
//       case 'user_not_found':
//         if (kDebugMode) {
//           print('User not found.');
//         }
//         Utils.snackBar("UserId not found","Try with another email id");
//         break;
//       case 'invalid_credentials':
//         if (kDebugMode) {
//           print('Invalid credentials.');
//         }
//         Utils.snackBar("Invalid Credentials","Try with another email id");
//         break;
//       default:
//         if (kDebugMode) {
//           print(error.toString());
//         }
//         //Utils.snackBar("Error", error.toString());
//         break;
//     }
//   }
//   void handleFirebaseFirestoreException(var error) {
//     switch (error.toString()) {
//       case 'invalid-argument':
//         if (kDebugMode) {
//           print('The provided argument is invalid.');
//         }
//         break;
//       case 'permission-denied':
//         if (kDebugMode) {
//           print('The user does not have permission to perform the operation.');
//         }
//         Utils.snackBar("Permission Denied","Try our Subscriptions");
//         break;
//       case 'document-does-not-exist':
//         if (kDebugMode) {
//           print('The document does not exist.');
//         }
//         Utils.snackBar("Error", error.toString());
//         break;
//       case 'field-not-found':
//         if (kDebugMode) {
//           print('The field does not exist.');
//         }
//         Utils.snackBar("Error", error.toString());
//         break;
//       case 'invalid-document-id':
//         if (kDebugMode) {
//           print('The document ID is invalid.');
//         }
//         Utils.snackBar("Error", error.toString());
//         break;
//       case 'too-many-requests':
//         if (kDebugMode) {
//           print('The user has exceeded the number of allowed requests per second.');
//         }
//         Utils.snackBar("Server Down", "server_exception".tr);
//         break;
//       case 'network-error':
//         if (kDebugMode) {
//           print('A network error has occurred.');
//         }
//         InternetException("");
//         Utils.snackBar("NO Internet", "Check Your Internet Collections");
//         break;
//       case 'unavailable':
//         if (kDebugMode) {
//           print('The service is unavailable.');
//         }
//         Utils.snackBar("Error", error.toString());
//         break;
//       default:
//         if (kDebugMode) {
//           print(error.toString());
//         }
//         Utils.snackBar("Error", error.toString());
//         break;
//     }
//   }
//
//   void handleFirebaseCloudStorageException(var error) {
//     switch (error.toString()) {
//       case 'invalid-argument':
//         if (kDebugMode) {
//           print('The provided argument is invalid.');
//         }
//         Utils.snackBar("Error", error.code.toString());
//         break;
//       case 'permission-denied':
//         if (kDebugMode) {
//           print('The user does not have permission to perform the operation.');
//         }
//         Utils.snackBar("Server Down", "server_exception".tr);
//         break;
//       case 'object-not-found':
//         if (kDebugMode) {
//           print('The object does not exist.');
//         }
//         Utils.snackBar("Error", error.toString());
//         break;
//       case 'invalid-file-name':
//         if (kDebugMode) {
//           print('The file name is invalid.');
//         }
//         Utils.snackBar("Error", error.toString());
//         break;
//       case 'too-many-requests':
//         if (kDebugMode) {
//           print('The user has exceeded the number of allowed requests per second.');
//         }
//         Utils.snackBar("Server Down", "server_exception".tr);
//         break;
//       case 'network-error':
//         if (kDebugMode) {
//           print('A network error has occurred.');
//         }
//         InternetException("");
//         Utils.snackBar("NO Internet", "Check Your Internet Collections");
//         break;
//       case 'unavailable':
//         if (kDebugMode) {
//           print('The service is unavailable.');
//         }
//         Utils.snackBar("Error", error.toString());
//         break;
//       default:
//         if (kDebugMode) {
//           print(error.toString);
//         }
//         //Utils.snackBar("Error", error.toString());
//         break;
//     }
//   }
//
//   void handleFirebaseUserError(error) {
//     switch (error.toString()) {
//       case "invalid-email":
//         if (kDebugMode) {
//           print("Invalid email address");
//         }
//         Utils.snackBar("Error", error.toString());
//         break;
//       case "wrong-password":
//         if (kDebugMode) {
//           print("Incorrect password");
//         }
//         Utils.snackBar("Error", error.toString());
//         break;
//       case "user-not-found":
//         if (kDebugMode) {
//           print("User not found");
//         }
//         Utils.snackBar("Error", error.toString());
//         break;
//       case "account-exists-with-different-credential":
//         if (kDebugMode) {
//           print("Account exists with different credential");
//         }
//         Utils.snackBar("Error", error.toString());
//         break;
//       case "too-many-requests":
//         if (kDebugMode) {
//           print("Too many requests");
//         }
//         Utils.snackBar("Server Down", "server_exception".tr);
//         break;
//       case "network-error":
//         if (kDebugMode) {
//           print("Network error");
//         }
//         InternetException("");
//         Utils.snackBar("NO Internet", "Check Your Internet Collections");
//         break;
//       case "unknown-error":
//         if (kDebugMode) {
//           print("Unknown error");
//         }
//         Utils.snackBar("Server Down", "server_exception".tr+ error.toString());
//         break;
//       default:
//         if (kDebugMode) {
//           print("Unknown error");
//         }
//         Utils.snackBar("Error", error.toString());
//         break;
//     }
//   }
//
//
//
//
// }