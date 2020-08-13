# Configuring MFA for your Azure app

1. Nagivate to [http://portal.azure.com](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview) and go to the Active Directory

2. Go to the "Security" tab on the left nav

![](./assets/firefox_LbLdVReFS1.png)

2. Go to the "Conditional Access" tab that appeared on the left nav

![](./assets/firefox_uXURDr8Zko.png)

3. Click "New Policy"

![](./assets/firefox_i56MC9d9Yq.png)

4. Set the "Users and groups" assignment to affect "All users"

![](./assets/firefox_kHFxJF7wuX.png)

5. Set the "Cloud apps or actions" to affect your specific apps

You can select multiple apps for the policy to affect.

![](./assets/firefox_onKPA9dgxw.png)

![](./assets/firefox_TY0cNm6VkJ.png)

6. Under "Access controls", go to the "Grant" section to activate MFA requirements

![](./assets/firefox_Yyw3Hwv9tn.png)

7. Enable the policy, then click "Create"

![](./assets/firefox_PbZeUWFg5K.png)