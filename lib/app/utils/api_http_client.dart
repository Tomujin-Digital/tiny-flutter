// import 'dart:async';

// import 'package:dio/dio.dart';
// import 'package:get/get.dart';

// import '../modules/0_initial/controllers/auth_controller.dart';

// class ApiHttpClient {
//   final AuthController authCtrl = Get.find<AuthController>();
//   // get authToken => authCtrl.token;
//   // String authToken = '';

//   final dio = Dio(
//     BaseOptions(baseUrl: 'https://tiny-customer-dev.herokuapp.com/v1'),
//   );

//   Completer<void>? authLock;

//   Future<dynamic> get<T>(
//     String path, {
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onReceiveProgress,
//     bool useAuth = true,
//   }) {
//     return dio.get(
//       path,
//       queryParameters: queryParameters,
//       options: options,
//       cancelToken: cancelToken,
//       onReceiveProgress: onReceiveProgress,
//     );
//   }

//   /// HTTP POST request.
//   Future<dynamic> post(
//     String path, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) {
//     return dio.post(
//       path,
//       data: data,
//       queryParameters: queryParameters,
//       options: options,
//       cancelToken: cancelToken,
//       onSendProgress: onSendProgress,
//       onReceiveProgress: onReceiveProgress,
//     );
//   }

//   /// HTTP PUT request.
//   Future<dynamic> put(
//     String path, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) {
//     return dio.put(
//       path,
//       data: data,
//       queryParameters: queryParameters,
//       options: options,
//       cancelToken: cancelToken,
//       onSendProgress: onSendProgress,
//       onReceiveProgress: onReceiveProgress,
//     );
//   }

//   /// HTTP HEAD request.
//   Future<dynamic> head(
//     String path, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//   }) {
//     return dio.head(
//       path,
//       data: data,
//       queryParameters: queryParameters,
//       options: options,
//       cancelToken: cancelToken,
//     );
//   }

//   /// HTTP DELETE request.
//   Future<dynamic> delete(
//     String path, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//   }) {
//     return dio.delete(
//       path,
//       data: data,
//       queryParameters: queryParameters,
//       options: options,
//       cancelToken: cancelToken,
//     );
//   }

//   /// HTTP PATCH request.
//   Future<dynamic> patch(
//     String path, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) {
//     return dio.patch(
//       path,
//       data: data,
//       queryParameters: queryParameters,
//       options: options,
//       cancelToken: cancelToken,
//       onSendProgress: onSendProgress,
//       onReceiveProgress: onReceiveProgress,
//     );
//   }

//   ApiHttpClient() {
//     final authCtrl = Get.find<AuthController>();
//     dio.interceptors.clear();

//     dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (
//           RequestOptions options,
//           RequestInterceptorHandler handler,
//         ) async {
//           if (authLock != null) {
//             await authLock!.future;
//           }

//           if (authToken != null) {
//             options.headers['Authorization'] =
//                 'Bearer ${authToken!.accessToken}';
//           }

//           handler.next(options);
//         },
//         onResponse: (
//           response,
//           ResponseInterceptorHandler handler,
//         ) async {
//           if (response.data['error'] == 'UnauthorizedError') {
//             // Refresh token.

//             if (authLock != null && !(authLock!.isCompleted)) {
//               await authLock!.future;
//             } else {
//               authLock = Completer();
//               await authCtrl.refreshToken();
//               authLock!.complete();
//             }

//             // Can't refresh. Log out.
//             if (authToken == null) {
//               authCtrl.logOut();
//             }

//             response.requestOptions.headers['Authorization'] =
//                 'Bearer ${authToken!.accessToken}';

//             final opts = Options(
//               method: response.requestOptions.method,
//               headers: response.requestOptions.headers,
//             );

//             // log("RESENDING ${response.realUri.path}");

//             final newResponse = await Dio(dio.options).request(
//               response.requestOptions.path,
//               options: opts,
//               data: response.requestOptions.data,
//               queryParameters: response.requestOptions.queryParameters,
//             );

//             if (newResponse.data['error'] != null) {
//               return handler.reject(
//                 DioError(
//                   requestOptions: newResponse.requestOptions,
//                   response: newResponse,
//                   type: DioErrorType.response,
//                 ),
//               );
//             }

//             return handler.next(newResponse);
//           }

//           if (response.data['error'] != null) {
//             return handler.reject(
//               DioError(
//                 requestOptions: response.requestOptions,
//                 response: response,
//                 type: DioErrorType.response,
//               ),
//             );
//           }

//           return handler.next(response);
//         },
//       ),
//     );
//   }

//   /// Returns response.body['data']
// //   Future<dynamic> postMultipart(
// //     String path, {
// //     bool useAuth = true,
// //     Map<String, String>? body,
// //     required Map<String, Uint8List> files,
// //   }) async {
// //     var formData = FormData();

// //     if (body != null) formData.fields.addAll(body.entries);

// //     for (var entry in files.entries) {
// //       formData.files.add(
// //         MapEntry(
// //           entry.key,
// //           MultipartFile.fromBytes(
// //             List<int>.from(entry.value),
// //             filename: 'avatar.jpg',
// //             contentType: MediaType('image', 'jpeg'),
// //           ),
// //         ),
// //       );
// //     }

// //     return await post(path, data: formData);
// //   }
// // }
// }
