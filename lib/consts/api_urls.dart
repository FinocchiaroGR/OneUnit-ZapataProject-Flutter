/* -- Base URL for EMULATING DEVICE --
For android emulation use: 
const baseurl = "http://10.0.2.2:1337/api";
For ios emulation use: 
const baseurl = "http://localhost:1337/api";

If it doesn't work. Use your local ip address
*/
const baseurl = "http://192.168.1.14:1337/api";
Uri user = Uri.parse("$baseurl/clients/");
Uri login = Uri.parse("$baseurl/auth/login");
Uri logout = Uri.parse("$baseurl/auth/logout");
Uri cars = Uri.parse("$baseurl/cars/client/");
Uri userValidity = Uri.parse("$baseurl/clients/update-license/");
Uri carInsuPol = Uri.parse("$baseurl/cars/update-policy/");
Uri carCirVal = Uri.parse("$baseurl/cars/update-circulation/");
Uri carVeriVal = Uri.parse("$baseurl/cars/update-verification/");
Uri gps = Uri.parse("$baseurl/v1/gps/get/");
