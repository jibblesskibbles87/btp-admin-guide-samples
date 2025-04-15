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

To ensure consistent naming of your resources, we encapsulate the guidlines in a dedicated module.

Besides the naming we will also include the labels that can be attached to some resources on SAP BTP.
