# Enabling token encryption

## Relevant links

Azure cert uploading  
https://docs.microsoft.com/en-us/azure/active-directory/manage-apps/howto-saml-token-encryption

Shib cert rollover  
https://www.switch.ch/aai/guides/sp/certificate-rollover/

## Enabling chaining and token encryption

1. Configure cert chaining in shibboleth

Edit shibboleth.xml and replace the credential resolver with the following:

```xml
        <CredentialResolver type="Chaining">
             <!-- Active certificate -->
             <CredentialResolver type="File"
                                 key="/run/secrets/sp_key_old" 
                                 certificate="/run/secrets/sp_cert_old"/>
             <!-- Additional new certificate -->
             <CredentialResolver type="File"
                                 key="/run/secrets/sp_key" 
                                 certificate="/run/secrets/sp_cert"/>
        </CredentialResolver>
```

This will let shibboleth roll over to a new certificate when the active one is invalidated by updating the IdP config

2. Update the Azure configuration

On the left nav for the Enterprise Application in the Azure AD resource, go to **Token encryption**

From that page, there is an **Import Certificate** button that will let you upload the `sp-cert.pem` file.

Enabling the encryption will make the SAML response from Azure to your SP become encrypted.

The chaining configuration in the SP lets you update which certificate is active in Azure without having to update the SP.

## Rolling the certs

1. Delete sp-cert-old.pem
1. Move sp-cert.pem to sp-cert-old.pem
1. Generate new sp-cert.pem
1. Rebuild SP container with the new keys.
1. Upload new sp-cert.pem to Azure
1. Set new key as active
