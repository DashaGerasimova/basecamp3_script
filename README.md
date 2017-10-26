# basecamp3_script
Script that deletes people from basecamp, who doesn't have access to any project
## How to use
First of all, set required environmental variables:
```
export ACCESS_TOKEN=PASTE_YOUR_ACCESS_TOKEN_HERE
export ACCOUNT_ID=PASTE_YOUR_ACCOUNT_ID_HERE
export USER_AGENT_APP=PASTE_YOUR_APP_HERE
export USER_AGENT_LINK=PASTE_LINK_TO_APP_HERE
```
Steps to launch script:
```
git clone https://github.com/DashaGerasimova/basecamp3_script.git
```
```
cd basecamp3_script
```
```
thor script:run
```
(This is safe mode. It only gets extra people's id)
```
thor script:run --delete
```
(Script that deletes all extra people)

## How to get my ACCESS_TOKEN?
To get OAuth2 access token from basecamp 3, you should do three steps:
1) Open this link in browser:
https://launchpad.37signals.com/authorization/new?type=web_server&client_id=ENTER_YOUR_CLIENT_ID&redirect_uri=ENTER_YOUR_REDIRECT_URI
Click "Accept it"
2) Copy verification code from address bar in opened page
(https://example.com/auth?code=YOUR_CODE_IS_HERE)
3) run curl -d "type=web_server&client_id=ENTER_YOUR_CLIENT_ID&redirect_uri=ENTER_YOUR_REDIRECT_URI" -X POST https://launchpad.37signals.com/authorization/token

After that you should recieve your access_token
