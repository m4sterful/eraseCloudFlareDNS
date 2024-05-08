It turns out that if you add a domain to CloudFlare with a wildcard entry, it adds about 1000 DNS entries and then crashes. That is... really not useful. 

The cloudflare interface can not delete more than 1 DNS entry at the time which would make deleting 1000 entries nearly impossible. Deleting the domain and re-adding it won't help either.

I whipped this up quickly to fix all that. This script uses the CloudFlare API to liquidate all DNS entries for a cloudflare domain.
