const baseurl = "http://localhost:1337/";
const home = "/";
const login = "/login";
const userInfo = "/id/user";
const carInfo = "/autoInfo";
const carLocation = "/location";
const componentsShowcase = "/id/components-showcase";

class ApiConstants {
  static Uri apiUser = Uri.parse("$baseurl/api/user");
  static Uri apiModValidity = Uri.parse("$baseurl/api/modUserValidity");
}
