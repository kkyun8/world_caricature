import axios from "axios";
import { OK, CREATED, UNPROCESSABLE_ENTITY } from "../packs/util";

const state = {
  user: null,
  apiStatus: null,
  errorMessages: null,
  alertMessages: null,
};

const getters = {
  loginCheck: (state) => !!state.user,
};

const mutations = {
  setUser(state, user) {
    state.user = user;
  },
  setApiStatus(state, status) {
    state.apiStatus = status;
  },
  setErrorMessages(state, messages) {
    state.errorMessages = messages;
  },
  setAlertMessages(state, messages) {
    state.alertMessages = messages;
  },
};

const actions = {
  /**
   * 会員登録
   * @param {*} context
   * @param {*} params
   */
  async register(context, params) {
    const response = await axios.post("/api/users", params);

    if (response.status === OK) {
      context.commit("setApiStatus", true);
      context.commit("setUser", response.data.user);
      return false;
    } else {
      context.commit("setApiStatus", false);
      context.commit("setErrorMessages", response.data.messages);
    }
  },
  async login(context, params) {
    //TODO:
    const response = await axios.get(
      "/api/login?email=" + params.email + "&password=" + params.password
    );

    if (response.status === OK) {
      context.commit("setApiStatus", true);
      context.commit("setUser", response.data.user);
    }

    context.commit("setApiStatus", false);

    if (response.status === UNPROCESSABLE_ENTITY) {
      context.commit("", response.data.errors);
    } else {
      context.commit("error/setCode", response.status, { root: true });
    }
  },
  async logout(context) {
    const response = await axios.post("/api/logout");

    if (response.status === OK) {
      context.commit("setApiStatus", true);
      context.commit("setUser", null);
      return false;
    }

    context.commit("setApiStatus", false);
    context.commit("error/setCode", response.status, { root: true });
  },
};

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
};
