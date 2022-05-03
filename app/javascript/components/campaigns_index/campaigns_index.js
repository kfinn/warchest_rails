import h from "h";
import { useEffect } from 'react';
import { useQuery } from 'react-query';
import api from 'api';
import _ from 'lodash';
import Link from '../router/link';

export default function CampaignsIndex() {
  const { data: { data: campaigns } } = useQuery(
    ['campaigns'],
    () => api.get('campaigns.json')
  )

  useEffect(() => console.log('campaigns:', campaigns), [campaigns]);

  return h`
    ${
      _.map(
        campaigns,
        (campaign) => h`
          <div key=${campaign.id}>
            <${Link} to=${`campaigns/${campaign.id}`}>
              ${campaign.name}
            <//>
          </div>
        `
      )
    }
  `;
}