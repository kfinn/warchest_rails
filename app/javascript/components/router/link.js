import h from 'h';
import { useCallback } from 'react';
import { useRouterContext } from './router_context';

export default function Link({ to, children }) {
  const { pushState } = useRouterContext();
  const onClick = useCallback((e) => {
    e.preventDefault();
    pushState({ pathname: to })
  }, [to, pushState]);

  return h`<a href=${to} onClick=${onClick}>${children}</a>`;
}
