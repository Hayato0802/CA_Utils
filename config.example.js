// Configuration file for Co-Assign Utils
// Copy this file to config.js and update with your organization's URLs

const CONFIG = {
    // Time tracking system URL pattern
    TIMETRACKING_URL_PATTERN: 'https://*.example-timetracking.com/worksheet/*',
    TIMETRACKING_BASE_URL: 'https://subdomain.example-timetracking.com/worksheet',
    
    // HRMOS URL pattern
    HR_SYSTEM_URL_PATTERN: 'https://p.ieyasu.co/works/*',
    
    // GitHub repository (for updates)
    GITHUB_REPO: 'organization/extension-repo',
    
    // Time adjustment settings
    OFFSET_MINUTES: 5,
    OFFSET_60_MINUTES: 60
};

// Export for use in extension
if (typeof module !== 'undefined' && module.exports) {
    module.exports = CONFIG;
}