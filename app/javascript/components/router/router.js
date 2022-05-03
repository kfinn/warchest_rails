import h from 'h';
import { useState, useMemo } from "react";
import RouterContext from "./router_context";
import _ from 'lodash';

function computeMatch(routes, location) {
  const locationSegments = _.compact(_.split(location.pathname, '/'));
  for (const route of routes) {
    const routeSegments = _.compact(_.split(route.path, '/'));
    if (_.size(routeSegments) != _.size(locationSegments)) {
      continue;
    }
    const segmentPairs = _.zip(routeSegments, locationSegments);
    let params = {};
    let matching = true;
    for (const [routeSegment, locationSegment] of segmentPairs) {
      if (_.startsWith(routeSegment, ':')) {
        params[routeSegment.slice(1)] = locationSegment
      } else if (routeSegment !== locationSegment) {
        matching = false;
        break;
      }
    }
    if (matching) {
      return { component: route.to, params };
    }
  }
}

export default function Router({ routes }) {
  const [location, setLocation] = useState({ pathname: window.location.pathname });
  
  const routerContext = useMemo(() => ({
    location,
    pushState: setLocation
  }), [location, setLocation]);

  const match = useMemo(() => computeMatch(routes, location), [routes, location])

  return h`
    <${RouterContext.Provider} value=${routerContext}>
      <${match.component} ...${match.params}/>
    <//>
  `
}
