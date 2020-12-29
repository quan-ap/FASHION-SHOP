import { baseURL } from "../Constants/baseUrl.js";

export function callApi(callback) {
  let urlApi = baseURL;
  fetch(urlApi)
    .then((res) => {
      return res.json();
    })
    .then(callback)
    .catch((err) => {
      console.log(err);
    });
}

export function postApi(data, callback) {
  let urlApi = baseURL;
  let options = {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  };
  fetch(urlApi, options)
    .then((res) => {
      return res.json();
    })
    .then(callback);
}

export function putApi(data, callback, idItem) {
  let urlApi = `${baseURL}/${idItem}`;
  let options = {
    method: "PUT",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  };
  fetch(urlApi, options)
    .then((res) => {
      return res.json();
    })
    .then(callback);
}

export function deleteApi(idItems, callback) {
  let urlApi = `${baseURL}/${idItems}`;
  let options = {
    method: "DELETE",
    headers: {
      "Content-Type": "application/json",
    },
    body: null,
  };
  fetch(urlApi, options)
    .then((res) => {
      return res.json();
    })
    .then(callback);
}
