CI CD for iOS

- Code pushed/Pull Request → CI runs
  - Branch strategy(deep dive will adopt our branch rule)
    * main → PR --> Build release to prod
    * stage → PR/Commit --> Build release to stage
    * feature/main_*** → PR/Commit --> Build release to QA
    * hotfix/ → PR/Commit --> Build release to QA
- Code Quality Checks(SwiftLint)
- Automated tests run
- Automated Deployment to TestFairy, Firebase,...
  * Centralizes signing certs & provisioning profiles.
  * Version Automatically 
- Slack/Teams notifications sent
- 