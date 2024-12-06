const blockedSites = [
  { domain: "download.cnet.com", reason: "Malware Risk", redirectPage: "blocklist.html" },
  { domain: "", reason: "Violates Media Acceptance Rules", redirectPage: "blocklist2.html" },
  { domain: "n4l.co.nz", reason: "Violates Access to Freedom", redirectPage: "blocklist3.html"},
];

// Listen for navigation events
chrome.webNavigation.onBeforeNavigate.addListener((details) => {
  const url = new URL(details.url);

  // Check if the current site is in the blocked list
  const blockedSite = blockedSites.find(site => site.domain === url.hostname);
  
  if (blockedSite) {
    let redirectUrl = chrome.runtime.getURL(blockedSite.redirectPage);
    
    // Redirect to a different block page based on the reason
    chrome.tabs.update(details.tabId, { url: redirectUrl });
  }
}, { url: [{ hostContains: '' }] });