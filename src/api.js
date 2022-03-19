import axios from "axios";
import { authHeader, getJwtToken, getUserIdFromToken } from "./auth";

const API_URL = `http://${location.hostname}:8000`;

class Api {
  getArticles() {
    return axios.get(API_URL + "/articles", {})
  }

  getAllHabits(username) {
    if (username) {
      return axios.get(`${API_URL}/habit?username=eq.${username}`);
    } else {
      return axios.get(`${API_URL}/habit`);
    }
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
  
  getAllAccounts() {
    return axios.get(`${API_URL}/user_account`);
  }
  
  getCategories(username) {
    return axios.get(`${API_URL}/category?username=eq.${username}`);
  }

  addHabit(habit) {
    return axios.post(
      API_URL + "/habit",
      {
        ...habit,
        // add user id from JWT token
        username: getUserIdFromToken(getJwtToken()),
      },
      {
        headers: authHeader(),
      }
    );
  }

  addHabitInstance(habit_instance) {
    return axios.post(
      API_URL + "/habit_instance",
      {
        ...habit_instance,
        // add user id from JWT token
        username: getUserIdFromToken(getJwtToken()),
      },
      {
        headers: authHeader(),
      }
    );
  }

  addDaySummary(day_summary) {
    const username = getUserIdFromToken(getJwtToken());
    return axios.put(
      `${API_URL}/day_summary?day=eq.${day_summary.day}&username=eq.${username}`,
      {
        ...day_summary,
        // add user id from JWT token
        username: username,
      },
      {
        headers: authHeader(),
      }
    );
  }

  addCategory(category) {
    return axios.post(
      API_URL + "/category",
      {
        ...category,
        // add user id from JWT token
        username: getUserIdFromToken(getJwtToken()),
      },
      {
        headers: authHeader(),
      }
    );
  }

  updateHabit(habit) {
    const username = getUserIdFromToken(getJwtToken());
    return axios.patch(
      API_URL + `/habit?habit_id=eq.${habit.habit_id}`,
      {
        ...habit,
        // add user id from JWT token
        username: getUserIdFromToken(getJwtToken()),
      },
      {
        headers: authHeader(),
      }
    );
  }
  
  updateHabitInstance(habit) {
    const username = getUserIdFromToken(getJwtToken());
    return axios.patch(
      API_URL + `/habit_instance?habit_id=eq.${habit.habit_id}&day=eq.${habit.day}&username=eq.${username}`,
      {
        ...habit,
        // add user id from JWT token
        username: username,
      },
      {
        headers: authHeader(),
      }
    );
  }

  deleteHabit(id) {
    return axios.delete(API_URL + `/habit?habit_id=eq.${id}`, {
      headers: authHeader(),
    });
  }
  
  updateUser(user) {
    return axios.patch(
      `${API_URL}/user_account?username=eq.${user.username}`,
      {
        ...user
      },
      {
        headers: authHeader()
      }
    );
  }
  
  deleteUser(user) {
    return axios.delete(`${API_URL}/user_accout?username=eq.${user.username}`, {
      headers: authHeader()
    });
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
