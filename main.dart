import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';


import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validators/validators.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/position/gf_toast_position.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:validators/sanitizers.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),

    );
  }
}


//Shard preference

/*
 */



class SharedPref {
  static const String KEY_FCM_TOKEN = 'fcm_token';
  static const String KEY_IS_LOGGED_IN = 'is_logged_in';
  static const String KEY_IS_CUSTOMMER = 'is_customer';
  static const String KEY_USER_ID = 'user_id';
  static const String KEY_MATRI_ID = 'matri_id';
  static const String KEY_EMAIL = 'user_agent';
  static const String KEY_USERNAME = 'username';
  static const String KEY_FIRSTNAME = 'firstname';
  static const String KEY_LASTNAME = 'lastname';
  static const String KEY_PHOTO1 = 'photo1';
  static const String KEY_PLAN_NAME = 'plan_name';
  static const String KEY_PLAN_STATUS = 'plan_status';
  static const String KEY_GENDER = 'gender';
  static const String KEY_MOBILE = 'mobile';
  static const String KEY_MOBILE_VERIFY_STATUS = 'mobile_verify_status';

  static const String KEY_LOGIN_RESPONSE = 'login_response';
  static const String KEY_USER_PASSWORD = 'user_password';
  static const String KEY_IS_INTRO_DONE = 'is_intro_done';

  static const String KEY_MOBILE_NO = 'mobile_no';
  static const String KEY_NAME = 'firstname';
  static const String KEY_PHOTO = 'photo1';

  Future<String?> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  save(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<bool> readBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  saveBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  readWithDecode(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      return json.decode(prefs.getString(key)!);
    } else {
      return null;
    }
  }

  saveWithEncode(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}


//LOGIN SCREEN

// import 'package:flutter/material.dart';
//
// import 'package:untitled/shard_pref.dart';
//

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {'user_agent':'','username': '', 'password': ''};
  late CommonBloc _bloc;
  late SharedPref _sharedPref;
  bool isLoadingButton = false;
  bool isShowPasswordField = false;
  bool isObscureText = true;
  bool isPasswordVisible = true;

  String? title = 'Login';

  LoginModel? loginResponseModel;

  String deviceId = '';

  void initState() {
    _sharedPref = SharedPref();
    _bloc = CommonBloc();
    getDeviceId().then((value) => deviceId = value ?? '');
    super.initState();
  }

  Future<String?> getDeviceId() async {
    return _sharedPref.read(SharedPref.KEY_FCM_TOKEN).then((value) => value);
  }
  void _loginRequest() {
    setState(() {
      isLoadingButton = true;
    });
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _bloc.directPostRequestDemo(CUSTOMER_LOGIN, _formData, 'CUSTOMER_LOGIN').then((value) {
        setState(() {
          isLoadingButton = false;
        });
        if (value != null && value.status! )  {
          loginResponseModel = LoginModel.fromJson(value.object);
          if (loginResponseModel != null) {
            showToast(loginResponseModel!.message!, context, true);
            _sharedPref.save('status', loginResponseModel!.status!);
            _sharedPref.save('message', loginResponseModel!.message!);
            _sharedPref.save('data', loginResponseModel!.data.toString());
            _sharedPref.save('status_code', loginResponseModel!.statusCode.toString());
            _sharedPref.saveBool(SharedPref.KEY_IS_LOGGED_IN, true);
          }
        }
        else{
          showToast(value?.object["message"] ?? "Something went wrong", context, false);
        }

      });
    } else {
      setState(() {
        isLoadingButton = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration:  const BoxDecoration(
            color: Colors.white,

          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: (100),
                ),


                SizedBox(
                  height: (50),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left:(10),right: (10)),
                        child: MyCustomTextField(
                            hint: "Enter Name",
                            inputType: TextInputType.name,
                            postParamKey: "user_agent",
                            emptyError: "Please enter Email OR User Name",
                            formData: _formData
                        ),
                      ),
                      SizedBox(height: (10),),
                      Padding(
                        padding:  EdgeInsets.only(left:(10),right: (10)),
                        child: MyCustomTextField(
                            hint: "Enter Number",
                            inputType: TextInputType.number,
                            postParamKey: "username",
                            emptyError: "Please enter Email OR User Name",
                            formData: _formData
                        ),
                      ),
                      SizedBox(height: (10),),
                      Padding(
                        padding:  EdgeInsets.only(
                            left:(10),
                            right: (10)),
                        child: MyCustomTextField(
                          hint: "Password*",
                          inputType: TextInputType.visiblePassword,
                          emptyError: "Please enter password",
                          prefix: Icon(Icons.lock, color: Colors.black, size: 20),
                          isPasswordVisible: isPasswordVisible,
                          postParamKey: "password",
                          formData: _formData,
                        ),
                      )
                      // customPasswordFild('Password',TextInputType.visiblePassword,),
                    ],
                  ),
                ),
                loginResponseModel != null  ? Container(
                  height: 120,
                  decoration: BoxDecoration(color: Colors.green,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 10,right:  (10),top:  (10)),
                  child: SingleChildScrollView(child: Column(
                    children: [
                      Text("${loginResponseModel!.message}"),
                      Text("${loginResponseModel!.status}"),
                      Text("${loginResponseModel!.statusCode}"),
                      Text("${loginResponseModel!.data}"),
                      Text("${loginResponseModel!.data!.photoUrl}"),
                      Text("${loginResponseModel!.data!.forceUpdate}"),
                      Text("${loginResponseModel!.data!.mediaBaseUrl}"),

                    ],
                  )),
                ) : Container(),
                ElevatedButton(
                    onPressed: () {
                      _loginRequest();
                      isLoadingButton =true;
                    },
                    child: Text('Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//RESPONSES
//COMMON RESPONCE




class CommonResponse {
  String? message;
  bool? status;
  bool? isLoggout;
  Map<String, dynamic>? data;
  String? tocken;

  int? mobile;
  String? id;
  dynamic object;
  CommonResponse({this.message, this.status, this.data});
  CommonResponse.fromJson(Map<String, dynamic> json, String? requestTag) {
    object = json;

    if (json.containsKey('message')) {
      print("-----------${message = getValueFromJson(json, 'message')}");
      message = getValueFromJson(json, 'message');
    }
    if (json.containsKey('status_code')) {
      message = getValueFromJson(json, 'status_code');

    }
    if (json.containsKey('status')) {
      status = getBoolValueFromJson(json, 'status');
    }
    if (json.containsKey('is_loggout')) {
      isLoggout = getBoolValueFromJson(json, 'is_loggout');
    }

    try {
      if (json.containsKey('status')) {
        status = getBoolValueFromJson(json, 'status');
      }
    } catch (e) {
      print('error in status ${e}');
    }
    if (json.containsKey('device_tocken')) {
      tocken = getValueFromJson(json, 'device_tocken');
    }
    if (json.containsKey('user_id')) {
      id = getValueFromJson(json, 'user_id');
    }
  }

  String getValueFromJson(Map<String, dynamic> json, String key) {
    if (json.containsKey(key)) {
      print("data response :" + json[key].toString());
      Container(
          color: Colors.green,
          height: 100,
          child: Text("data response :" + json[key].toString()));

      return json[key].toString();
    } else {
      return "";
    }
  }

  int getIntFromJson(Map<String, dynamic> json, String key) {
    if (json.containsKey(key)) {
      print("data response MMM: " + json[key]);
      return json[key];
    } else {
      return 0;
    }
  }

  bool getBoolValueFromJson(Map<String, dynamic> json, String key) {
    if (json.containsKey(key)) {
      return toBoolean(json[key].toString());
    } else {
      return false;
    }
  }
}

//APP_EXCEPTION

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

//API_RESPONCE
class ApiResponse<T> {
  ApiResponse.loading(this.message) : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  Status status;

  T? data;

  String? message;

  @override
  String toString() {
    return 'status : $status \n message : $message \n data : $data';
  }
}

enum Status { LOADING, COMPLETED, ERROR }

//API_BASE_HELPER
class ApiBaseHelper {
  // Future<dynamic> getRequest(String url, Map<String, String> queryParams) async {
  //   String? token = ApplicationData().getTocken;
  //   var responseJson;
  //   try {
  //     var uri = isSecureUrl == true ? Uri.https(BASE_URL, url) : Uri.http(BASE_URL, url);
  //
  //     final Map<String, String> _headers = {
  //       'tocken': token ?? '',
  //     };
  //
  //     print(uri);
  //     final response = await http.get(uri, headers: _headers);
  //     responseJson = _returnResponse(response);
  //   } on SocketException {
  //     print('No net');
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }

  Future<dynamic> postRequest(String url, dynamic body, Map<String, String> queryParams) async {
    // String? token = ApplicationData().getTocken;

    var responseJson;
    try {
      var uri = isSecureUrl == true ? Uri.https(BASE_URL, url, queryParams) : Uri.http(BASE_URL, url, queryParams);
      print(uri);
      print(body);
      final response = await http.post(uri, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postRequestDemo(String url, dynamic body) async {
    var responseJson;
    try {
      var uri = isSecureUrl == true ? Uri.https(BASE_URL, url) : Uri.http(BASE_URL, url);
      // final Map<String, String> _headers = {
      //   'tocken': token ?? '',
      // };
      print(uri);
      //printParamLog(_headers);
      print(body);
      final response = await http.post(uri, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> multipartRequest(String url, dynamic body, Map<String, File?> files, Map<String, String> queryParams) async {
    String? token = ApplicationData().getTocken;
    var responseJson;
    try {
      var uri = isSecureUrl == true ? Uri.https(BASE_URL, url, queryParams) : Uri.http(BASE_URL, url, queryParams);

      final Map<String, String> _headers = {
        'tocken': token ?? '',
      };

      print(_headers);
      print(uri);
      print(body);
      final request = await http.MultipartRequest('POST', uri);

      //header
      request.headers.addAll(_headers);

      //params
      Map<String, dynamic> params = body as Map<String, dynamic>;
      params.forEach((key, value) {
        request.fields[key] = value;
      });

      //files
      files.forEach((key, file) {
        print('file name : ' + (file!.path.split("/").last));
        print('file path : ' + file.path);
        request.files.add(http.MultipartFile.fromBytes(key, File(file.path).readAsBytesSync(), filename: file.path.split("/").last));
      });

      var response = await request.send();
      final respStr = await response.stream.bytesToString();
      print('respStr dddd :${respStr}');
      responseJson = _returMultipartResponse(respStr);
      print('respStr fff :${responseJson}');
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> putRequest(String url, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      // var uri = Uri.https(BASE_URL, url, {'q': '{http}'});
      var uri = isSecureUrl == true ? Uri.https(BASE_URL, url, {'q': '{http}'}) : Uri.http(BASE_URL, url, {'q': '{http}'});
      final response = await http.put(uri, body: json.decode(body.toString()));
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> deleteRequest(String url) async {
    print('Api delete, url $url');
    var apiResponse;
    try {
      // var uri = Uri.https(BASE_URL, url, {'q': '{http}'});
      var uri = isSecureUrl == true ? Uri.https(BASE_URL, url, {'q': '{http}'}) : Uri.http(BASE_URL, url, {'q': '{http}'});

      final response = await http.delete(uri);
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      print('responseJson in ApiBaseHelper : ${response.body}');
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      print('responseJson in BadRequestException : ${response.body}');
      throw BadRequestException(response.body.toString());
    case 401:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 403:
      print("responseJson in UnauthorisedException : ${response.body}");
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}

dynamic _returMultipartResponse(String response) {
  final responseJson = json.decode(response);
  var status = false;
  if (responseJson['status'] != null) {
    status = toBoolean(responseJson['status'].toString());
    if (status) {
      status = true;
      return responseJson;
    } else {
      return responseJson;
    }
  } else {
    return responseJson;
  }
}
//REPOSITORY
//APPLICATION_DATA
class ApplicationData {
  static ApplicationData? _instance;
  static String? _photoURL;
  static bool? _isLoggedIn;
  static bool? _isShowAnnouncementOneTime = false;
  static bool _isUpdateRequired = false;
  static bool _isFromNotification = false;
  static String? _userID;
  static String? _tocken;
  static String? _userName;
  static String? _fullName;
  static String? _email;
  static bool _isFromBackgroundNotification = false;

  ApplicationData._internal() {
    print("ApplicationData first time init");
    _instance = this;
  }

  factory ApplicationData() => _instance ?? ApplicationData._internal();

  String? get getPhotoURL => _photoURL;
  set setPhotoURL(String photoURL) => _photoURL = photoURL;

  bool? get getIsLoggedIn => _isLoggedIn;
  set setIsLoggedIn(bool val) => _isLoggedIn = val;

  bool? get getIsShowAnnouncementOneTime => _isShowAnnouncementOneTime;
  set setIsShowAnnouncementOneTime(bool val) => _isShowAnnouncementOneTime = val;

  bool get getIsUpdateRequired => _isUpdateRequired;
  set setIsUpdateRequired(bool val) => _isUpdateRequired = val;

  bool get getIsFromNotification => _isFromNotification;
  set setIsFromNotification(bool val) => _isFromNotification = val;

  String? get getMemberID => _userID;
  set setMemberID(String val) => _userID = val;

  String? get getTocken => _tocken;
  set setTocken(String val) => _tocken = val;

  String? get getUserName => _userName;
  set setUserName(String val) => _userName = val;

  String? get getFullName => _fullName;
  set setFullName(String val) => _fullName = val;

  String? get getEmail => _email;
  set setEmail(String val) => _email = val;

  bool get getIsFromBackgroundNotification => _isFromBackgroundNotification;
  set setIsFromBackgroundNotification(bool val) => _isFromBackgroundNotification = val;

}
//MAINREPOSITORY
class MainRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<CommonResponse> commonMultipartRequest(dynamic body, String url, Map<String, File?> files, Map<String, String> queryParams) async {
    final response = await _helper.multipartRequest(url, body, files, queryParams);
    return CommonResponse.fromJson(response, null);
  }

  //common Api Calls
  Future<CommonResponse> commonPostRequest(String url, dynamic body, Map<String, String> queryParams) async {
    final response = await _helper.postRequest(url, body, queryParams);
    return CommonResponse.fromJson(response, null);
  }

  Future<CommonResponse> commonPostRequestDemo(String url, dynamic body) async {
    final response = await _helper.postRequestDemo(url, body);
    return CommonResponse.fromJson(response, null);
  }
}
//SHARED_PREF


//LOGIN_MODEL

class LoginModel {
  LoginModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,});

  LoginModel.fromJson(dynamic json) {
    statusCode = json['status_code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = statusCode;
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }

}
class PhotoUrl {
  PhotoUrl({
    this.memberPhotoUrl,});

  PhotoUrl.fromJson(dynamic json) {
    memberPhotoUrl = json['memberPhotoUrl'];
  }
  String? memberPhotoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['memberPhotoUrl'] = memberPhotoUrl;
    return map;
  }

}
class Data {
  Data({
    this.mediaBaseUrl,
    this.photoUrl,
    this.forceUpdate,});

  Data.fromJson(dynamic json) {
    mediaBaseUrl = json['mediaBaseUrl'];
    photoUrl = json['photoUrl'] != null ? PhotoUrl.fromJson(json['photoUrl']) : null;
    forceUpdate = json['force_update'];
  }
  String? mediaBaseUrl;
  PhotoUrl? photoUrl;
  String? forceUpdate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mediaBaseUrl'] = mediaBaseUrl;
    if (photoUrl != null) {
      map['photoUrl'] = photoUrl!.toJson();
    }
    map['force_update'] = forceUpdate;
    return map;
  }

}

//CUSTOM_WIDGET
//API_URLS
const String BASE_URL = "www.alaminumrahservice.com";
const String FULL_API_URL = "https://www.alaminumrahservice.com/api/common-request";
const String PREFIX_URL = "/api/";
const bool isSecureUrl = true;
//--------------------customer user api--------------------//
const String CUSTOMER_LOGIN = PREFIX_URL + "common-request";

//COMMON_WIDGET
void showToast(String message, BuildContext context, bool isSuccess) {
  GFToast.showToast(
      message, context,
      toastPosition: GFToastPosition.BOTTOM, backgroundColor: isSuccess == true ? Colors.green : Colors.red,toastDuration: 3);
}

//CUSTOM TEXT_FILD

class MyCustomTextField extends StatelessWidget {
  final String hint;
  final TextInputType? inputType;
  final String? emptyError;
  final String? validationError;
  final String postParamKey;
  final Map<String, dynamic> formData;
  final int maxLine;
  final int maxLength;
  final bool? isEnable;
  final bool isOnlyDigitValid;
  final bool isPasswordVisible;
  final VoidCallback? onTapSuffixEyeIcon;
  final TextCapitalization textCapitalization;
  final String? initialValue;
  final TextEditingController? controller;
  final Widget? prefix;

  MyCustomTextField({
    Key? key,
    required this.hint,
    this.inputType,
    this.emptyError,
    this.validationError,
    required this.postParamKey,
    required this.formData,
    this.maxLine = 1,
    this.maxLength = 50,
    this.textCapitalization = TextCapitalization.none,
    this.initialValue,
    this.isEnable,
    this.isOnlyDigitValid = false,
    this.isPasswordVisible = false,
    this.onTapSuffixEyeIcon = null,
    this.prefix = null,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: TextFormField(
        maxLines: maxLine,
        decoration: maxLine > 1
            ? getMultiLineInputDecoration(hint)
            : getInputDecoration(hint: hint, isPasswordVisible: isPasswordVisible, onTap: onTapSuffixEyeIcon),
        keyboardType: inputType,
        textCapitalization: textCapitalization,
        maxLength: maxLength,
        enabled: isEnable,
        obscureText: (isPasswordVisible && onTapSuffixEyeIcon != null),
        controller: controller == null ? null : controller,
        initialValue: initialValue,
        inputFormatters: isOnlyDigitValid ? [FilteringTextInputFormatter.digitsOnly] : null,
        validator: (value) {
          //add your custom validations
          if (emptyError != null && emptyError!.isNotEmpty) {
            if (value!.isEmpty) {
              return emptyError;
            } else if (inputType == TextInputType.emailAddress && !EmailValidator.validate(value))
            {return validationError;}
            else if (inputType == TextInputType.url && !isURL(value))
            {return validationError;}
            else if (maxLength == 10 && (value.length < 10)) return validationError;
          }
          if (value!.length > 0 && validationError != null && validationError!.isNotEmpty && inputType == TextInputType.url && !isURL(value)) {
            {return validationError;}
          }
          if (value.length > 0 &&
              validationError != null &&
              validationError!.isNotEmpty &&
              inputType == TextInputType.visiblePassword &&
              value.length < 9) {
            return validationError;
          }
          return null;
        },
        onSaved: (String? value) {
          formData[postParamKey] = value;
        },
      ),
    );
  }

  InputDecoration getInputDecoration({String? hint, bool isPasswordVisible = false, VoidCallback? onTap}) {
    return InputDecoration(
      // cvcvv hintText: hint,
      labelText: hint,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      isDense: true,
      filled: true,
      counterText: "",
      labelStyle: textFieldHintTextStyle,
      hintStyle: textFieldHintTextStyle,
      fillColor: Colors.white,
      focusColor: Colors.black,
      prefixIcon: prefix != null ? prefix : null,
      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.black),),
      enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.grey),),
      focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.grey),),
      errorBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.red),),
    );
  }

  InputDecoration getMultiLineInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      isDense: true,
      filled: true,
      counterText: "",
      labelStyle: textFieldTextStyle,
      hintStyle: textFieldHintTextStyle,
      fillColor: Colors.white,
      focusColor: Colors.black,
      prefixIcon: prefix != null ? prefix : null,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.red),
      ),
    );
  }

  final textFieldHintTextStyle =  TextStyle(color:Colors.black, fontSize:14, fontWeight: FontWeight.normal);

  final textFieldTextStyle =  TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal);
}

//BLOC


class CommonBloc {
  late MainRepository _mainRepository;

  StreamController? _commonController;

  StreamSink<ApiResponse<CommonResponse>> get commonSink => _commonController!.sink as StreamSink<ApiResponse<CommonResponse>>;
  Stream<ApiResponse<CommonResponse>> get commonStream => _commonController!.stream as Stream<ApiResponse<CommonResponse>>;

  CommonBloc() {
    _commonController = StreamController<ApiResponse<CommonResponse>>();
    _mainRepository = MainRepository();
  }

  //api for without ui interaction
  // Future<CommonResponse?> directGetRequest(String url, String? tag, Map<String, String> queryParams) async {
  //   try {
  //     CommonResponse response = await _mainRepository.commonGetData(url, queryParams);
  //     return response;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  Future<CommonResponse?> directPostRequest(String url, dynamic body, String? tag, Map<String, String> queryParams) async {
    try {
      CommonResponse response = await _mainRepository.commonPostRequest(url, body, queryParams);
      print("Success response in directPostRequest :- ${response.status}");
      return response;
    } catch (e) {
      print("Error response in directPostRequest :- ${e}");
      return null;
    }
  }

  Future<CommonResponse?> directPostRequestDemo(String url, dynamic body, String? tag) async {
    try {
      CommonResponse response = await _mainRepository.commonPostRequestDemo(url, body);

      print("Success response in directPostRequest :- ${response.status}");
      return response;
    } catch (e) {
      print("Error response in directPostRequest :- $e");
      return null;
    }
  }

  Future<CommonResponse?> directMultipartRequest(
      dynamic body, String url, Map<String, File?> files, String tag, Map<String, String> queryParams) async {
    try {
      CommonResponse response = await _mainRepository.commonMultipartRequest(body, url, files, queryParams);
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  //api for ui interaction for builder model
  // getRequest(String url, String tag, String? page, String? searchKeyword, Map<String, String> queryParams) async {
  //   commonSink.add(ApiResponse.loading('Please Wait..'));
  //   try {
  //     CommonResponse response = await _mainRepository.commonGetData(url, queryParams);
  //     if (response.status == 'status_code') {
  //       commonSink.add(ApiResponse.completed(response));
  //     } else {
  //       commonSink.add(ApiResponse.error(response.message));
  //
  //     }
  //   } catch (e) {
  //     commonSink.add(ApiResponse.error(e.toString()));
  //     print(e);
  //   }
  // }

  postRequest(String url, dynamic body, String? tag, Map<String, String> queryParams) async {
    print('API POST REQ BEGINS');
    commonSink.add(ApiResponse.loading('Please Wait..'));
    try {
      CommonResponse response = await _mainRepository.commonPostRequest(url, body, queryParams);
      print("response in com block : ${response}");
      if (response.status == 'status_code') {
        commonSink.add(ApiResponse.completed(response));
      } else {
        commonSink.add(ApiResponse.error(response.message));
      }
    } catch (e) {
      commonSink.add(ApiResponse.error(e.toString()));
      print('ERROR IN POST REQ');
      print(e);
    }
  }

  multipartRequest(dynamic body, String url, Map<String, File?> files, String tag, Map<String, String> queryParams) async {
    print("params for $url in registerRequest $body");
    commonSink.add(ApiResponse.loading('Please Wait..'));
    try {
      CommonResponse response = await _mainRepository.commonMultipartRequest(body, url, files, queryParams);
      if (response.status == 'status_code') {

        commonSink.add(ApiResponse.completed(response));
      } else {
        commonSink.add(ApiResponse.error(response.message));

      }
    } catch (e) {
      print('Code Code--------------------->>>>>>${e}');
      commonSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _commonController?.close();
  }
}
