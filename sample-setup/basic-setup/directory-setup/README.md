# Sample Setup for a Basic Directory Structure

## Assumptions

- We assume that we use the directories as structuring element for the subaccounts i.e., un an unmanaged fashion.
- We assume that we do the directory setup in one run for all involved departments.

## Design Decsion

We decouple the directory creation i.e., the setup of the basic structure from the creation of the operational units namely the subaccounts inside of the directory. The changes on directory level are probably a rare sceanrio compared to the subaccounts (depending on their stage) and we therefore want to avoid side effects as well as lengthy state refreshes.

## Directory Setup

We will create directories for the following departments:

- HR
- Sales
- Finance

In addition we create a directory for shared services.

All directories are located in EMEA.
