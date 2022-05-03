import api from "api";
import h from "h";
import _ from "lodash";
import { useQuery } from "react-query";
import Link from "../router/link";

export default function CampaignsShow({ id }) {
  const {
    data: { data: campaign },
  } = useQuery(["campaigns", id], () => api.get(`campaigns/${id}.json`));

  return h`
    <h1>${campaign.name}</h1>
    <h2>Budgets</h2>
    <ul>
      ${_.map(
        campaign.budgets,
        (budget) => h`
            <li key=${budget.id}>
              <${Link} to=${`/budgets/${budget.id}`}>
                ${budget.name}
              <//>
              ${" "}
              (Current COH $${budget.currentCashOnHand})
            </li>
          `
      )}
    </ul>
  `;
}
