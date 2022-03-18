import jwt_decode from "jwt-decode";

export function getJwtToken() {
  return localStorage.getItem("accessToken");
}

export function getUserIdFromToken(token) {
  const decoded = jwt_decode(token);
  console.log(decoded);
  return decoded._username;
}

export function getRoleFromToken(token) {
  return jwt_decode(token).role;
}

export function setJwtToken(token) {
  localStorage.setItem("accessToken", token);
}

export function deleteJwtToken() {
  localStorage.removeItem("accessToken");
}

export function authHeader() {
  let accessToken = getJwtToken();

  if (accessToken) {
    return { Authorization: "Bearer " + accessToken };
  } else {
    return {};
  }
}
