/* -- Base URL for EMULATING DEVICE --
For android emulation use: 
const baseurl = "http://10.0.2.2:1337/api";
*** If this url does not work on android, you would need
to search for your LOCAL IP Address and use it instead.

For ios emulation use: 
const baseurl = "http://localhost:1337/api";

-- Base URL for API SERVER --

For Server API use:
const baseurl = "http://54.176.51.35:1337/api";

-- NOTE --

IF YOU WANT TO SEE CAR IMAGES ON CAROUSEL OR CAR INFO 
you need to change the following files:
/lib/widgets/organisms/Carousel.dart
and 
/lib/pages/CarInfo.dart

Where it says "image.network", you need to change the URL
with the same you choose from above.

If it doesn't work. Use your local ip address
*/
const baseurl = "http://54.176.51.35:1337/api";
Uri user = Uri.parse("$baseurl/clients/");
Uri login = Uri.parse("$baseurl/auth/login");
Uri logout = Uri.parse("$baseurl/auth/logout");
Uri cars = Uri.parse("$baseurl/cars/client/");
Uri userValidity = Uri.parse("$baseurl/clients/update-license/");
Uri carInsuPol = Uri.parse("$baseurl/cars/update-policy/");
Uri carCirVal = Uri.parse("$baseurl/cars/update-circulation/");
Uri carVeriVal = Uri.parse("$baseurl/cars/update-verification/");
Uri gps = Uri.parse("$baseurl/v1/gps/get/");
