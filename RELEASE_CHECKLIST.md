# CampusCompanion Release Checklist

## Pre-Release Preparation
- [ ] Update version code and version name in `app/build.gradle`
- [ ] Update `CHANGELOG.md` with release notes (create if it doesn't exist)
- [ ] Test the app thoroughly on multiple devices/emulators
- [ ] Verify all features work as expected in release build
- [ ] Test app upgrade from previous version (if applicable)
- [ ] Verify all assets (images, strings, etc.) are included

## Security & Privacy
- [ ] Ensure no sensitive information is hardcoded in the code
- [ ] Verify all API keys and secrets are properly secured
- [ ] Check all external dependencies for known security vulnerabilities
- [ ] Ensure proper permissions are requested and used appropriately

## Performance
- [ ] Test app startup time
- [ ] Check for memory leaks
- [ ] Verify efficient use of network and battery
- [ ] Test with restricted network conditions

## Localization
- [ ] Verify all user-facing strings are properly externalized
- [ ] Check layout and text in all supported languages
- [ ] Ensure proper RTL (Right-to-Left) support if needed

## Build Configuration
- [ ] Create or update signing configuration in `keystore.properties`
- [ ] Verify ProGuard/R8 rules in `proguard-rules.pro`
- [ ] Ensure proper build variants are configured
- [ ] Test both debug and release builds

## Testing
- [ ] Run all unit tests
- [ ] Run all instrumented tests
- [ ] Perform manual testing on different API levels
- [ ] Test on different screen sizes and densities
- [ ] Verify app behavior with different system settings

## App Store Preparation
- [ ] Prepare app screenshots for different device types
- [ ] Write a clear and compelling app description
- [ ] Prepare promotional graphics and feature graphics
- [ ] Set appropriate content rating
- [ ] Prepare privacy policy URL
- [ ] Prepare support contact information

## Release Process
1. Build the release APK/AAB:
   ```
   ./gradlew assembleRelease
   # or for Android App Bundle
   ./gradlew bundleRelease
   ```
2. Test the generated APK/AAB on a real device
3. Upload to Google Play Console or your preferred distribution platform
4. Roll out to a small percentage of users first (staged rollout)
5. Monitor crash reports and user feedback
6. Proceed with full rollout if no critical issues are found

## Post-Release
- [ ] Monitor crash reports and analytics
- [ ] Be prepared to release a hotfix if critical issues are found
- [ ] Update documentation if needed
- [ ] Announce the release to your users

## Notes
- Keep the keystore file (`keystore.jks`) and `keystore.properties` secure and backed up
- Never commit sensitive information to version control
- Consider using environment variables or a secure secrets management solution for sensitive data
