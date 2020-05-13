//TODO: dotenv
require("dotenv").config();

const state = {
  postalCodeApiUrl: process.env.POSTAL_CODE_API_URL,
  postalCodeApiKey: process.env.POSTAL_CODE_API_KEY,
  authKey: process.env.AUTH_KEY,
};

export default {
  namespaced: true,
  state,
};
