# F5 BIG-IP AS3 VIP Module 
The following repo/code is used to manage my F5 BIGIP configuration using Infrastructure As code.

* Use HashiCorp Vault as my PKI Engine to generate certs
* Use Terraform with F5-DO to Deploy the base/network configurations
* Use Terraform with F5 AS3 with our custom module to allow me to deploy apps
* Use Terraform Cloud to manage the state of the F5 BIG-IP
* Use Github as our Source Code Repository.

![title](./images/image.png)

## How do we use it...
Well it's simple, to deploy a new secure "https" app, all we have to do it create a new file  in the folder with a .tf and add the paramters required. Using the apps-module and the as3templates folder.

For example if we want to build a vip with the following criteria
1. HTTPS (Secure)
2. 3 Pool members on port 8443
3. https health monitor
4. Cookie persistance
5. Get a new cert from the Vault PKI Engine 

We would create someting like this 

```
module "tfc-webfront-newapp" {
  source            = "./apps-module"
  tenant            = "tfc-webfront-newapp"
  common_name       = "newapp.example.com"
  as3tmpl           = "https"
  vip_address       = "10.99.99.11"
  pki_name          = "example-dot-com"
  pool_members_port = "8443"
  monitor           = "https"
  pool_members      = ["10.10.5.1", "10.10.5.2", "10.10.5.3"]
}
```



Configure Vault
Configure PKI Engine

```
vault secrets enable pki
vault secrets tune -max-lease-ttl=87600h pki
```

2. Generate root CA and Configure CA and CRL URL


```
vault write -field=certificate pki/root/generate/internal common_name=maniak.academy ttl=87600h > CA_cert.crt

     
vault write pki/config/urls issuing_certificates="$VAULT_ADDR/v1/pki/ca" crl_distribution_points="$VAULT_ADDR/v1/pki/crl"
```


3. Generate Intermediate CA

```
vault secrets enable -path=pki_int pki
vault secrets tune -max-lease-ttl=43800h pki_int
```

4. Execute the following command to generate an intermediate and save the CSR as pki_intermediate.csr

```
vault write -format=json pki_int/intermediate/generate/internal \
     common_name="maniak.academy Intermediate Authority" \
     | jq -r '.data.csr' > pki_intermediate.csr
```

5. Sign the intermediate certificate with the root CA private key, and save the generated certificate as intermediate.cert.pem.

```
vault write -format=json pki/root/sign-intermediate csr=@pki_intermediate.csr \
     format=pem_bundle ttl="43800h" \
     | jq -r '.data.certificate' > intermediate.cert.pem
```

6. Once the CSR is signed and the root CA returns a certificate, it can be imported back into Vault.

```
vault write pki_int/intermediate/set-signed certificate=@intermediate.cert.pem
```

7. Create a Role named maniak-dot-academy which allows subdomains.

```
vault write pki_int/roles/maniak-dot-academy \
 allowed_domains=maniak.academy” \
 allow_subdomains=true \
 ttls="10m" 

```


Done… let’s move onto the next part.