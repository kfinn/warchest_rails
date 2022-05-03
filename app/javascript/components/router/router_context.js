import { createContext, useContext } from 'react';
import _ from 'lodash';

const RouterContext = createContext({
  location: _.pick(window.location, 'pathname'),
  pushState: (newLocation) => {}
});
export default RouterContext;

export function useRouterContext() {
  return useContext(RouterContext);
}
