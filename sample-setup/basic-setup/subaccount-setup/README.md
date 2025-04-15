# Setup of a Subaccount

## Assumptions

- We assume that we use the directories as structuring element for the subaccounts i.e., un an unmanaged fashion.
- We assume that we do the directory setup in one run for all involved departments.

## Design Decsions

We decouple the directory creation i.e., the setup of the basic structure from the creation of the operational units namely the subaccounts inside of the directory. The changes on directory level are probably a rare sceanrio compared to the subaccounts (depending on their stage) and we therefore want to avoid side effects as well as lengthy state refreshes.

## Subaccount Setup

- Basic setup of a subaccount. Every subaccount is created seperately
- Naming Conventions and Labels
- Validation of Geo Region and Subaccount region
- Default Setup of custom IdP
- Provision CF env (optional)
- Execute default plus à la carte entitlements

### Validations for Geographies and BTP Regions

### Trust Configuration for Custom IdP

### Setup of Entitlements

### Setup of Cloud Foundry Environment
