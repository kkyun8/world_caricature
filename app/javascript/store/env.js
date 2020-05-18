require("dotenv").config();

const state = {
  postalCodeApiUrl: process.env.POSTAL_CODE_API_URL,
  postalCodeApiKey: process.env.POSTAL_CODE_API_KEY,
  oauthKey: process.env.OAUTH_KEY,
};

export default {
  namespaced: true,
  state,
};
