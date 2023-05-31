 class API {

  static const hostConnection =// 'http://191.96.63.143/tdawa';
     'https://tadawiapp.com/tdawa';
  //'http://192.168.1.13/tdawa';
  //'http://192.168.1.37/tdawa';
      //'http://192.168.1.13/tdawa';
  //'http://Ftp.Tadawiapp.Com';
      //'http://192.168.1.5/tdawa';
     // 'http://192.168.1.13/tdawa';
      //'http://192.168.1.13/tdawa';
  static const hostConnectionUser = '$hostConnection/user';
  static const validateEmail = '$hostConnection/user/validate_email.php';
  static const signup = '$hostConnection/doctor/signup.php';
  static const login = '$hostConnection/doctor/login.php';
  static const adminLogin = '$hostConnection/doctor/admin_login.php';
  static const addAdmin= '$hostConnection/doctor/add_admin.php';
  static const ModLogin = '$hostConnection/doctor/mod_login.php';
  static const UpdateAdsCoins = '$hostConnection/doctor/update_ads_coins.php';
  static const Coins = '$hostConnection/doctor/coins.php';
  static const UpdateLoginCoins = '$hostConnection/doctor/update_login_coins.php';
  static const UpdateSystemCoins = '$hostConnection/doctor/update_system_coins.php';
  static const getMod = '$hostConnection/doctor/All_moderators.php';
  static const addMod = '$hostConnection/doctor/moderators_add.php';
  static const deleteMod = '$hostConnection/doctor/delete_mod.php';
  static const deleteDoctor = '$hostConnection/doctor/delete_doctor.php';
  static const AddToTopDoctor = '$hostConnection/doctor/add_doctor_to_top.php';
  static const GetSystemBooking = '$hostConnection/doctor/get_system_booking.php';
  static const deleteAd = '$hostConnection/doctor/delete_ad.php';
  static const userLogin = '$hostConnection/doctor/user_login.php';
  static const userSignup = '$hostConnection/doctor/user_signup.php';
  static const appointments = '$hostConnection/doctor/ap.php';
  static const DoctorBookings = '$hostConnection/doctor/get_doctor_booking.php';
  static const getDoctorData = '$hostConnection/doctor/doctor_data.php';
  static const getDoctorAds = '$hostConnection/doctor/get_doctor_ads.php';
  static const RenewAd = '$hostConnection/doctor/renew_ad.php';
  static const allCat = '$hostConnection/doctor/cat.php';
  static const allAdmins = '$hostConnection/doctor/all_admins.php';
  static const addBooking = '$hostConnection/doctor/add_booking.php';
  static const getBooking = '$hostConnection/doctor/get_booking.php';
  static const SEARCH = '$hostConnection/doctor/search.php';
  static const allDoctorsData = '$hostConnection/patient/all_doctors.php';
  static const AdminGetDoctors = '$hostConnection/doctor/all_doc.php';
  static const AllSales = '$hostConnection/doctor/all_sales.php';
  static const SalesReg = '$hostConnection/doctor/sales_reg.php';
  static const SalesDelete = '$hostConnection/doctor/delete_sales.php';
  static const Country = '$hostConnection/doctor/country.php';
  static const addFav = '$hostConnection/doctor/add_fav.php';
  static const deleteFav = '$hostConnection/doctor/delete.php';
  static const validateFav = '$hostConnection/doctor/validate.php';
  static const getFav = '$hostConnection/doctor/read.php';

  static const bouquet = '$hostConnection/doctor/bouquet.php';

  static const bouquet2 = '$hostConnection/doctor/get_baka_sub.php';

  static const ads = '$hostConnection/doctor/ads.php';
  static const ads2 = '$hostConnection/doctor/ads2.php';
  static const adsx = '$hostConnection/doctor/adsx.php';
  static const AllBooking = '$hostConnection/doctor/all_booking.php';
  static const DeleteBaka = '$hostConnection/doctor/delete_baka.php';
  static const DeleteBaka2 = '$hostConnection/doctor/delete_baka2.php';
  static const DeleteCat = '$hostConnection/doctor/delete_cat.php';

  static const AddCat = '$hostConnection/doctor/add_cat.php';

  static const AddBaka = '$hostConnection/doctor/add_baka.php';
  static const AddBaka2 = '$hostConnection/doctor/add_baka2.php';

  static const AddCountry = '$hostConnection/doctor/add_country.php';
  static const UpdateCountry = '$hostConnection/doctor/update_country.php';
  static const AddBestAdd = '$hostConnection/doctor/add_best_ad.php';
  static const AddNewAdd = '$hostConnection/doctor/add_adsx.php';
  static const DeleteCountry = '$hostConnection/doctor/delete_country.php';

  static const DeleteAdmin = '$hostConnection/doctor/delete_admin.php';

  static const TopDoctors = '$hostConnection/doctor/top_doctors.php';

  static const Best = '$hostConnection/doctor/ads.php';


  // static const admin_login = '$hostConnection/admin/login.php';
  static const getUserData = '$hostConnection/doctor/get_user_data.php';
  static const adAds = '$hostConnection/doctor/add_ads.php';
  // static const getDoctorData= '$hostConnection/doctor/doctor_data.php';

  static const updateData = '$hostConnection/doctor/update_data.php';
  static const updateAd = '$hostConnection/doctor/update_ad.php';
  //
  // static const addToFav = '$hostConnection/User/fav/add.php';
  // static const  readFav= '$hostConnection/User/fav/read.php';

  //upload new items
  static const uploadItem = '$hostConnection/items/upload.php';
  //clothesItem
  static const getTrendingClothes = '$hostConnection/clothes/trending.php';
  static const getAllClothes = '$hostConnection/clothes/all_items.php';
  static const addToCart = '$hostConnection/cart/add.php';
  static const deleteFromCart = '$hostConnection/cart/delete.php';
  static const getCart = '$hostConnection/cart/read.php';
  static const updateQuantity = '$hostConnection/cart/update.php';

}
//192.168.1.10
//255.255.255.0 mask
//192.168.1.1