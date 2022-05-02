import h from 'h';
import { QueryClient, QueryClientProvider } from 'react-query';
import { Suspense, StrictMode } from 'react';
import CampaignsIndex from './campaigns/campaigns_index';

const queryClient = new QueryClient({ defaultOptions: { queries: { suspense: true } } });

export default function Warchest() {
  return h`
    <${StrictMode}>
      <${QueryClientProvider} client=${queryClient}>
        <${Suspense} fallback="Loading...">
          <${CampaignsIndex} />
        <//>
      <//>
    <//>
  `
}
