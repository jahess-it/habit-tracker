import axios from "axios";
import { authHeader, getJwtToken, getUserIdFromToken } from "./auth";

const API_URL = `http://${location.hostname}:8000`;

class Api {
  getArticles() {
    return axios.get(API_URL + "/articles", {});
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
    //TODO: Hash password
    return axios.post(API_URL + "/rpc/login", { username, password });
  }

  register(username, password, email, mobile_phone) {
    //TODO: Hash password
    return axios.post(API_URL + "/rpc/register", { username, password, email, mobile_phone });
  }
}

export default new Api();
