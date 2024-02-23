enum ErrorType {
  //custom error
  iOException,

  //Network Error
  network,
  netServerMessage,
  netDefaultError,
  unknown,
  // UI Errors
  ui,
  uiEmptyEmail,
  uiInvalidEmail,
  uiEmptyPassword,

  //DB ERROR
  database,
  databaseNotSupported,
  databaseError1,
  databaseUserNotFound,
  //Cart
  cartIsEmpty,

  //Voucher
  voucherIsNotAvailable,

  ////address////
  addressIsEmpty,

  ///order////
  notRated,


  //User
  userIdNotFound,

  //category
  blankCategory,

  //Address
  invalidAddress
}
