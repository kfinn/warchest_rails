import h from 'h';
import { QueryClient, QueryClientProvider } from 'react-query';
import { Suspense, StrictMode } from 'react';
import CampaignsIndex from './campaigns_index/campaigns_index';
import CampaignsShow from './campaigns_show/campaigns_show';
import BudgetsShow from './budgets_show/budgets_show';
import Router from './router/router';

const queryClient = new QueryClient({ defaultOptions: { queries: { suspense: true } } });

export default function Warchest() {
  return h`
    <${StrictMode}>
      <${QueryClientProvider} client=${queryClient}>
        <${Suspense} fallback="Loading...">
          <${Router} routes=${[
            {
              path: "",
              to: CampaignsIndex
            },
            {
              path: "campaigns",
              to: CampaignsIndex
            },
            {
              path: "campaigns/:id",
              to: CampaignsShow
            },
            {
              path: "budgets/:id",
              to: BudgetsShow
            }
          ]} />
        <//>
      <//>
    <//>
  `
}
