// Arkenfox Override Settings file

// What does this do?
// https://github.com/arkenfox/user.js/wiki/3.1-Overrides
// The override changes the stated settings, to fit your needs
// Please modify it how you like, but don't modify the user.js itself


// Cosmetic: prevent Amazon, Google etc. from being pinned to the Newtabpage should you use it
// remove pinned website ads
user_pref("browser.newtabpage.pinned","");
// remove Google & co. from "top sites"
user_pref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned","");


// delete history after one week
user_pref("browser.history_expire_days",7);
// restore pinned tabs
user_pref("browser.sessionstore.restore_pinned_tabs_on_demand",true);

// Librewolf only, possible through GUI
//user_pref("identity.fxaccounts.enabled", true);

// Allow search shortcuts (seems to be disabled?)
user_pref("keyword.enabled", true);

// Allow Firefoxes new Version notifications
user_pref("browser.startup.homepage_override.mstone", "REPLACEWITHVERSIONNUMBER"); // what to do to remove this line?
user_pref("browser.startup.homepage", "about:home");
user_pref("browser.startup.page", 3);

// History & Session
// delete history after one week
user_pref("browser.history_expire_days",7);
// restore pinned tabs
user_pref("browser.sessionstore.restore_pinned_tabs_on_demand",true);

user_pref("privacy.sanitize.sanitizeOnShutdown", false);
user_pref("privacy.clearOnShutdown.cache", false);
user_pref("privacy.clearOnShutdown.history", false);
user_pref("privacy.clearOnShutdown.sessions", false);

// remove pinned website ads
user_pref("browser.newtabpage.pinned","");
// remove Google & co. from "top sites"
user_pref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned","");

// System colors
user_pref("browser.display.use_system_colors", true);

user_pref("webgl.disabled", false);


// speed
user_pref("network.http.max-persistent-connections-per-server" 30);
user_pref("browser.cache.disk.enable", false);