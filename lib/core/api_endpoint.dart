import 'package:flutter/material.dart';

const String baseUrl = 'https://qvf-farms.herokuapp.com';

class ApiEndpoints {
  static String registerUser() {
    return '$baseUrl/api/v1/users/signup';
  }

  static String logInUser() {
    return '$baseUrl/api/v1/users/login';
  }

  static String getCategories() {
    return '$baseUrl/api/v1/users/allproducecategory';
  }

  static String createOrder() {
    return '$baseUrl/api/v1/users/createorder';
  }

  static String deleteOrder(String id) {
    return '$baseUrl/api/v1/users/deleteorder/$id';
  }

  static String updateOrder(String id) {
    return '$baseUrl/api/v1/users/updateorder/$id';
  }

  static String getAllOrders() {
    return '$baseUrl/api/v1/users/allorders';
  }

  static String getFarmDivisions() {
    return '$baseUrl/api/v1/users/farm-divisions';
  }

  static String logOutUser() {
    return '$baseUrl/api/v1/users/logout';
  }
}
