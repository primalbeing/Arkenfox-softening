#!/bin/sh

mkdir ~/snap/firefox/common/.mozilla/firefox/ARKENFOX

cd ~/snap/firefox/common/.mozilla/firefox/ARKENFOX

wget https://raw.githubusercontent.com/arkenfox/user.js/master/user.js

# enable Firefox sync (disabled on Librewolf) ----------
sed -i 's/identity.fxaccounts.enabled", false/identity.fxaccounts.enabled", true/g' user.js

# allow search engine shortcuts --------
sed -i 's/keyword.enabled", false/keyword.enabled", true/g' user.js

# allow new version notes -----------
sed -i 's/user_pref("browser.startup.homepage_override.mstone", "ignore");/#user_pref("browser.startup.homepage_override.mstone", "ignore");/g' user.js

# Allow Captive Portals: --------------
sed -i 's/user_pref(canonicalURL", ";/canonicalURL", "captive.kuketz.de/g' user.js
sed -i 's/portal-service.enabled", false/portal-service.enabled", true/g' user.js
xdg-open http://captive.kuketz.de
zenity --info --text="\"captive.kuketz.de\" will be used to detect captive portals. You can change it in the settings of \"arkenfox-script\"\." --title="Info"

# Enable Pocket news (Start page) --------------
sed -i 's/discoverystreamfeed", false/discoverystreamfeed", true/g' user.js
sed -i 's/topstories", false/topstories", true/g' user.js
sed -i 's/highlights.includePocket", false/highlights.includePocket", true/g' user.js

# Restore session, don't autodelete everything ------------------------
sed -i 's/startup.homepage", "about:blank"/startup.homepage", 3/g' user.js
printf """
user_pref("browser.history_expire_days",7);""" >> user.js
printf """
user_pref("browser.sessionstore.restore_pinned_tabs_on_demand",true);""" >> user.js
sed -i 's/sanitizeOnShutdown", true/sanitizeOnShutdown", false/g' user.js
sed -i 's/clearOnShutdown.cache", true/clearOnShutdown.cache", false/g' user.js
sed -i 's/clearOnShutdown.history", true/clearOnShutdown.history", false/g' user.js
sed -i 's/clearOnShutdown.sessions", true/clearOnShutdown.sessions", false/g' user.js

# Cosmetic: prevent Amazon, Google etc. from being pinned to the Newtabpage should you use it
printf """
user_pref("browser.newtabpage.pinned","");""" >> user.js
printf """
# remove Google & co. from "top sites"
user_pref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned","");""" >> user.js

# Cosmetic: use system colors
sed -i 's/system_colors", false/system_colors", true/g' user.js

# Improve speed through more caching
sed -i 's/cache.disk.enable", false/cache.disk.enable", true/g' user.js

# Allow WebGL
xdg-open https://addons.mozilla.org/en-US/firefox/addon/noscript/
zenity --info --text="WARNING! \n\n WebGL is enabled for compatibility. \n Please use NoScript and block WebGL on all levels. \n You can allow it with \"individual level \"\." --title="Browser Warning"

# Create a profile called arkenfox and set it as default

cd ~/snap/firefox/common/.mozilla/firefox/

printf"""[Profile2]
Name=Arkenfox
IsRelative=1
Path=ARKENFOX
""" >> profiles.ini

cp -r *.default-release/* ARKENFOX/ && rm -r *.default-release/*

zenity --info --text="The softened Arkenfox profile has been created, please open it. \n \n Under \"about:profiles\" you can create an insecure Profile \n for Banking sites and others, that may not work \n \n You can delete empty and unused profile folders now. \." --title="Info"

zenity --info --text="Please install NoScript and disable WebGL on all levels \n \n https://addons.mozilla.org/en-US/firefox/addon/noscript/ \." --title="Info"

snap run firefox -P

fi
