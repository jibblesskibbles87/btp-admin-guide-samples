# Terraform Samples for SAP BTP Administrator's Guide

## Paradigms

We follow the paradigms of a simpel and clear Terraform configuration as laid out in the [Simple, Clear, Maintainable](https://rosesecurity.dev/blog/2024/11/24/terraform-proverbs) blog post of the [Development Log](https://rosesecurity.dev/) especially:

- Clear is better than clever.
- Modules should be reusable, not rigid.
- Outputs are for sharing.
- Labels are free; use them liberally.
- Descriptions are for users.
- Use positive variable names to avoid double negatives.
- Name with underscores, not dashes.
- Using locals makes code descriptive and maintainable.

## Naming Conventions and Tagging

Ensuring naming conventions is one import aspect when provisioing and managing your SAP BTP account. We will align our samples in accordance to the [Naming Conventions for SAP BTP Accounts](https://help.sap.com/docs/btp/btp-admin-guide/naming-conventions-for-sap-btp-accounts).

To ensure consistent naming of your resources, we encapsulate the guidlines in dedicated module. Besides the naming we will also include the labels that can be attached to some resources on SAP BTP.

We have created one module for the level of the [directory](./modules/sap-btp-naming-conventions-directory/README.md) and one for the level of the [subaccount](./modules/sap-btp-naming-conventions-subaccount/README.md).

## Setup of Directories

The setup of directories as a structuring element for the subaccounts is configured in the folder `basic-setup/directory-setup`. The Details about the setup are described in the [README.md](./basic-setup/directory-setup/README.md) file.

## Setup of Subaccounts

The setup of subaccounts is configured in the folder `basic-setup/subaccount-setup`. The Details about the setup are described in the [README.md](./basic-setup/subaccount-setup/README.md) file.
