
## CloudFlare DNS Eraser - (c) 2024 Who cares

#You can use your global API key or make a custom one just for this domain
$APIKey = "Your API Key Here"

#Go into the domain and look on the right - "Zone ID"
$DNSKey = "Your DNS Zone ID here"

$headers=@{}
$headers.Add("Content-Type", "application/json")
$headers.Add("X-Auth-Email", "your@email.com")
$headers.Add( "Authorization","Bearer $($APIKey)")
$response = Invoke-WebRequest -Uri "https://api.cloudflare.com/client/v4/zones/$($DNSKey)/dns_records?per_page=1000" -Method GET -Headers $headers

# Convert JSON response to PowerShell object
$jsonResponse = $response.Content | ConvertFrom-Json

foreach ($record in $jsonResponse.result) {
    Write-Host "Record ID: $($record.id) - Type: $($record.type) - Name: $($record.name) - Content: $($record.content)"
	$response = Invoke-WebRequest -Uri "https://api.cloudflare.com/client/v4/zones/$DNSKey/dns_records/$($record.id)" -Method DELETE -Headers $headers
}

# That's it - Your DNS Records are clean!
