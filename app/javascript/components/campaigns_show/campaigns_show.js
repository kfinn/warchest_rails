import h from "h";
import api from 'api';
import Link from '../router/link';
import { useQuery } from 'react-query';
import _ from 'lodash';

export default function CampaignsShow({ id }) {
  const { data: { data: campaign } } = useQuery(
    ['campaigns', id],
    () => api.get(`campaigns/${id}.json`)
  );

  return h`
    <h1>${campaign.name}</h1>
    <h2>Budgets</h2>
    <ul>
      ${
        _.map(
          campaign.budgets,
          (budget) => h`
            <li key=${budget.id}>
              <${Link} to=${`budgets/${budget.id}`}>${budget.name}<//>
            </li>
          `
        )
      }
    </ul>
  `
}
