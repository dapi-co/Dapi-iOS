# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 2.3.0 - 2023-02-17
### Added
- Network Logging in the Dapi configuration.
- Add cooldown period properties `unit` and `value` in `error.dapiMetaData`

## 2.2.0 - 2022-12-26
### Added
- SDK Arabic localization  

## 2.1.0 - 2022-12-09
### Added
- Account selection using UI.

## 2.0.1 - 2022-12-06
### Fix
- Autoflow colors in dark mode.
- MFA colors in dark mode.
- MFA default colors and bank logo.

## 2.0.0 - 2022-11-10
### Added
- Support Objective c.
### Fix
- Fix countries code issue.
- Change AutoFlow delegate functions to be optional.

## 1.1.0 - 2022-10-21
### Added
- Add transactions types
    - default: transaction  won't include category and brandDetails
    - enriched: Each transaction object will have category and brandDetails properties.
    - categorized: Each transaction object will have a category property.

## 1.0.0 - 2022-10-17
### Added
- Rewriting the iOS SDK in Swift in order to modernize the code base.
- Officially support SPM 🎉.

## 1.0.0-beta4 - 2022-9-30
### Fix
- Refactor DapiConnections to DapiBankConnections.
- Remove environment form `DapiConfiguration`
- Remove completion from `Start` func
- Fix Accounts UI issues.
### Add
- Add: change beneficiary to be nullable for create transfer.
- Add: Dashboard beneficiary for create transfer.

## 1.0.0-beta3 - 2022-9-26
### Fix
- Local SDK server error.
- Add: successful message after init sdk.

## 1.0.0-beta2 - 2022-9-14
### Added
- Handle no internet connection.
- Make clientId associated with specific app key and environment.

## 1.0.0-beta1 - 2022-9-14
### Update
- Remove `Start` func callback.
- support MFA Multiple choices.

## 1.0.0-beta - 2022-9-14
### Added
- Rewriting the iOS SDK in Swift in order to modernize the code base.
- Officially support SPM 🎉.
- Dapi pod now is using XCFramework.
