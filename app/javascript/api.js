import Axios from 'axios';
import camelize from 'camelize';
import _ from 'lodash';
import snakeize from 'snakeize';

const axiosRequestConfig = {
  baseURL: `/api/v1`,
  responseType: 'json'
};

const NON_MUTATIVE_METHODS = ['get', 'GET', 'head', 'HEAD', 'link', 'LINK', 'unlink', 'UNLINK']

const injectAuthenticityToken = (request) => {
  if (_.includes(NON_MUTATIVE_METHODS, request.method)) {
    return request
  }
  const authenticityParam = document.querySelector('meta[name=csrf-param]').getAttribute('content');
  const authenticityToken = document.querySelector('meta[name=csrf-token]').getAttribute('content');
  return {
      ...request,
      data: {
        ...request.data,
        [authenticityParam]: authenticityToken
      }
  }
}

const snakeizeJsonRequest = (request) => {
  const { data, headers } = request;
  const isJson = !headers || headers['Content-Type'] === 'application/json';
  if (data && isJson) {
    return { ...request, data: snakeize(data) };
  } else {
    return request;
  }
};

const camelizeResponse = (response) => {
  if (_.has(response, 'data')) {
    return { ...response, data: camelize(response.data) };
  }
  return response;
};

const Api = Axios.create(axiosRequestConfig);
Api.interceptors.request.use(injectAuthenticityToken);
Api.interceptors.request.use(snakeizeJsonRequest);
Api.interceptors.response.use(camelizeResponse);

export default Api;
