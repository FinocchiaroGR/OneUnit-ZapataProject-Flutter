/* -- Base URL for EMULATING DEVICE --
For android emulation use: 
const baseurl = "http://10.0.2.2:1337/api";
For ios emulation use: 
const baseurl = "http://localhost:1337/api";
*/
const baseurl = "http://localhost:1337/api";
Uri user = Uri.parse("$baseurl/clients/flutter/");
Uri login = Uri.parse("$baseurl/auth/login");
Uri logout = Uri.parse("$baseurl/auth/logout");
Uri cars = Uri.parse("$baseurl/cars/client/");
Uri userValidity = Uri.parse("$baseurl/modUserValidity");
