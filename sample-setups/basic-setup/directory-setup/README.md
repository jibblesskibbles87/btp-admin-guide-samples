# Sample Setup for a Basic Directory Structure

## Assumptions

- We assume that we use the directories as structuring element for the subaccounts i.e., un an unmanaged fashion.
- We assume that we do the directory setup in one run for all involved departments.

## Design Decisions

We decouple the directory creation i.e., the setup of the basic structure from the creation of the operational units namely the subaccounts inside of the directories. The changes on directory level are probably a rare sceanrio compared to changes in the subaccounts additionally depending on their stage. We want to avoid side effects as well as lengthy state refreshes and keep the state of the directories seperate.

## Directory Setup

The creation of the directories is steered by a map of objects that define the business data relevant for a directory namely:

- business_unit (`string`): The business unit that owns the directory e.g., HR, IT, Finance
- costcenter (`string`): Cost center of the business unit
- directory_contacts (`list(string)`): List of email addresses representing the directory contacts
- region (`string`): The geographical region of the directory e.g., EMEA

This is input data is reflected by the variables defined in the [variables.tf](./variables.tf) file

The directories are provisioned via the [main.tf](./main.tf) file which delegates to the module [base-directory-setup](../../modules/base-directory-setup/README.md). This module combines the corresponding module containing the naming and labeling conventions for a directory and calls the Terraform resource [btp_directory](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/directory).

After provisioning the output summarizes the executed setup as given by the [outputs.tf](./outputs.tf) file. Here is an example how the output could look like:

![Sample Output for a directory](../../../assets/base-directory-output.png)

## SAP BTP Administrator's Guide - References

- [Naming and Directory Templates](https://help.sap.com/docs/btp/btp-admin-guide/naming-directory-templates)
