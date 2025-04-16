locals {
  default_entitlements = {
    "Dev" = {
      "alert-notification" = ["standard"],
      "auditlog"           = ["standard=1"],
      "sapappstudio"       = ["build-code"],
      "xsuaa"              = ["application"]
    },
    "Test" = {
      "alert-notification" = ["standard"],
      "auditlog"           = ["standard=1"],
      "xsuaa"              = ["application"]
    },
    "Prod" = {
      "alert-notification" = ["standard"],
      "auditlog"           = ["standard=1"],
      "xsuaa"              = ["application"]
    },
    "Shared" = {
      "credstore"  = ["standard"],
      "hana-cloud" = ["hana"],
      "hana"       = ["hdi-shared"]
    }
  }
}
