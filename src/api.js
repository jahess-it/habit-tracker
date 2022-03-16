import axios from "axios";
import { authHeader, getJwtToken, getUserIdFromToken } from "./auth";

const API_URL = `http://${location.hostname}:8000`;

class Api {
  getArticles() {
    return axios.get(API_URL + "/articles", {})
  }

  getAllHabits(username) {
    return axios.get(`${API_URL}/habit?username=eq.${username}`);
  }
  
  getUpcomingHabits(username) {
    return axios.get(`${API_URL}/upcoming?username=eq.${username}`);
  }

  getWeekView(username) {
    return axios.get(`${API_URL}/week?username=eq.${username}`);
  }

  getMonthView(username) {
    return axios.get(`${API_URL}/month?username=eq.${username}`);
  }

  getJournals(username) {
    return axios.get(`${API_URL}/journal?username=eq.${username}`);
  }
  
  getAccount(username) {
    return axios.get(`${API_URL}/user_account?username=eq.${username}`);
  }

  getArticleDetail(id) {
    return axios.get(API_URL + `/articles?articleid=eq.${id}`);
  }

  addArticle(article) {
    return axios.post(
      API_URL + "/articles",
      {
        ...article,
        // add user id from JWT token
        userid: getUserIdFromToken(getJwtToken()),
      },
      {
        headers: authHeader(),
      }
    );
  }

  updateArticle(article) {
    return axios.patch(
      API_URL + `/articles?articleid=eq.${article.articleid}`,
      article,
      {
        headers: authHeader(),
      }
    );
  }

  deleteArticle(id) {
    return axios.delete(API_URL + `/articles?articleid=eq.${id}`, {
      headers: authHeader(),
    });
  }

  publishArticle(id) {
    return axios.post(
      API_URL + "/rpc/publish",
      { id: id },
      {
        headers: authHeader(),
      }
    );
  }

  login(username, password) {
    return axios.post(API_URL + "/rpc/login", { username, password });
  }

  register(username, password, email, mobile_phone) {
    return axios.post(API_URL + "/rpc/register", { username, password, email, mobile_phone });
  }
}

export default new Api();
