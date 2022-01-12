policy "azure" {
  title = "Azure Security and Compliance pack"
  doc   = file("README.md")
  configuration {
    provider "azure" {
      version = ">= 0.2.4"
    }
  }
  policy "cis_v1.3.0" {
    source = file("cis_v1.3.0/policy.hcl")
  }
}
