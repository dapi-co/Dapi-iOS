# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
