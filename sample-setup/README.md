# Terraform Samples for SAP BTP Administrator's Guide

## Paradigms

We follow the paradigms of a simpel and clear Terraform configuration as laid out in the [Simple, Clear, Maintainable](https://rosesecurity.dev/blog/2024/11/24/terraform-proverbs) blog post of the [Development Log](https://rosesecurity.dev/) namely:

- Clear is better than clever.
- Version everything.
- Modules should be reusable, not rigid.
- State is a liability; manage it wisely.
- Every apply should be predictable.
- Outputs are for sharing.
- Tags are free; use them liberally.
- Understanding count versus for_each is essential.
- Descriptions are for users.
- Use positive variable names to avoid double negatives.
- Null is not the same as nothing.
- Prefer a single object over many related variables.
- Terraform is declarative; trust it to converge.
- Never output secrets.
- Upgrade deliberately, not impulsively.
- Name with underscores, not dashes.
- Using locals makes code descriptive and maintainable.

These paradigms will be reflected in the code samples provided in this repository and we encourage you to follow them in your own Terraform code.

## Naming Conventions and Tagging

Ensuring naming conventions is one import aspect when provisioing and managing your SAP BTP account. We will align our samples in accordance to the [Naming Conventions for SAP BTP Accounts](https://help.sap.com/docs/btp/btp-admin-guide/naming-conventions-for-sap-btp-accounts).

To ensure consistent naming of your resources, we encapsulate the guidlines in a dedicated module.

Besides the naming we will also include the labels that can be attached to some resources on SAP BTP.
