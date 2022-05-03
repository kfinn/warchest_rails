import _ from 'lodash';
import { createContext, useContext } from 'react';

const RouterContext = createContext({
  location: _.pick(window.location, 'pathname'),
  pushState: (_newLocation) => {},
});
export default RouterContext;

export function useRouterContext() {
  return useContext(RouterContext);
}
