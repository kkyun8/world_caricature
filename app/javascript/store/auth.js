import axios from "axios";
import { OK, CREATED, UNPROCESSABLE_ENTITY } from "../packs/util";

const state = {
  user: null,
  apiStatus: null,
  errorMessages: null,
  alertMessages: null,
};

const getters = {
  check: (state) => !!state.user,
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
  async register(context, params) {
    const response = await axios.post("/api/register", params);

    context.commit("setUser", response.data);

    if (response.status === CREATED) {
      context.commit("setApiStatus", true);
      context.commit("setUser", response.data);
      return false;
    }

    context.commit("setApiStatus", false);
    if (response.status === UNPROCESSABLE_ENTITY) {
      context.commit("setErrorMessages", response.data.errors);
    } else {
      // 通信に失敗した場合に error モジュールの setCode ミューテーションを commit していますが、
      // あるストアモジュールから別のモジュールのミューテーションを commit する場合は
      // 第三引数に { root: true } を追加します。
      // TODO:
      context.commit("error/setCode", response.status, { root: true });
    }
  },
  async login(context, params) {
    const response = await axios.post("/api/login", params);

    if (response.status === OK) {
      context.commit("setApiStatus", true);
      context.commit("setUser", response.data);
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
