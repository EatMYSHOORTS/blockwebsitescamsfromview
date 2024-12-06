const blockedSites = ["download.cnet.com", "blocked-site.com"];

chrome.webNavigation.onBeforeNavigate.addListener((details) => {
  const url = new URL(details.url);
  if (blockedSites.includes(url.hostname)) {
    chrome.tabs.update(details.tabId, {
      url: chrome.runtime.getURL("blocklist.html")
    });
  }
}, { url: [{ hostContains: '' }] });
