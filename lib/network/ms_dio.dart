import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saturn_login/utils/request_api.dart';

import 'package:flutter/material.dart';

import './api.dart';

Dio msDio = Dio();

String formatError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      debugPrint('连接超时');
      return '连接超时';
    case DioErrorType.sendTimeout:
      debugPrint('请求超时');
      return '请求超时';
    case DioErrorType.receiveTimeout:
      debugPrint('响应超时');
      return '响应超时';
    case DioErrorType.response:
      debugPrint('出现异常');
      return '出现异常';
    case DioErrorType.cancel:
      debugPrint('请求取消');
      return '请求取消';
    default:
      debugPrint(error.message);
      return error.message;
  }
}

Future<SCResult> get(
  String url, {
  Map<String, dynamic>? data,
  Options? options,
  CancelToken? cancelToken,
  bool showToastError = true,
}) async {
  try {
    debugPrint('requestUri---$baseUrl$url');

    final Response response = await msDio.get(url,
        queryParameters: data, options: options, cancelToken: cancelToken);

    debugPrint('get success---------${response.statusCode}');

    if (response.statusCode == 200) {
      final data = json.decode(response.data);
      return SCResult(
        code: response.statusCode!,
        message: '请求成功',
        data: data,
        success: true,
      );
    } else {
      if (showToastError) {
        Fluttertoast.showToast(msg: response.statusMessage ?? '请求失败');
      }

      return SCResult.error(
        code: response.statusCode ?? 400,
        message: response.statusMessage ?? '请求失败',
      );
    }
  } on DioError catch (error) {
    debugPrint('get error -------- $error');
    if (showToastError) Fluttertoast.showToast(msg: formatError(error));
    return SCResult.error(
      code: error.response?.statusCode ?? 400,
      message: formatError(error),
    );
  }
}
