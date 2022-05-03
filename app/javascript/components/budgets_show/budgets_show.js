import api from 'api';
import h from 'h';
import { useQuery } from 'react-query';

export default function BudgetsShow({ id }) {
  const { data: { data: budget } } = useQuery(
    ['budgets', id],
    () => api.get(`budgets/${id}.json`)
  )

  return h`
    <h1>${budget.campaign.name} > ${budget.name}</h1>
    <dl>
      <dt>Total Contributions</dt>
      <dd>${budget.totalContributions}</dd>
      <dt>Total Disbursements</dt>
      <dd>${budget.totalDisbursements}</dd>
      <dt>Total Cash On Hand</dt>
      <dd>${budget.totalCashOnHand}</dd>
    </dl>
  `
}
