policy "cis_v1.3.0" {
  title = "v1.3.0 Policy"
  doc   = file("cis_v1.3.0/README.md")
  configuration {
    provider "azure" {
      version = ">= 0.2.4"
    }
  }

  policy "1" {
    title = "Section 1"
    doc   = file("cis_v1.3.0/docs/1.md")

    check "1.1" {
      title = "Ensure that multi-factor authentication is enabled for all privileged users (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.1.md")
    }

    check "1.2" {
      title = "Ensure that multi-factor authentication is enabled for all non-privileged users (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.2.md")
    }

    check "1.3" {
      title = "Ensure guest users are reviewed on a monthly basis (Automated)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.3.md")
    }

    check "1.4" {
      title = "Ensure that 'Allow users to remember multi-factor authentication on devices they trust' is 'Disabled' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.4.md")
    }

    check "1.5" {
      title = "Ensure that 'Number of methods required to reset' is set to '2' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.5.md")
    }

    check "1.6" {
      title = "Ensure that 'Number of days before users are asked to re-confirm their authentication information' is not set to \"0\" (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.6.md")
    }


    check "1.7" {
      title = "Ensure that 'Notify users on password resets?' is set to 'Yes' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.7.md")
    }


    check "1.8" {
      title = "Ensure that 'Notify all admins when other admins reset their password?' is set to 'Yes' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.8.md")
    }

    check "1.9" {
      title = "Ensure that 'Users can consent to apps accessing company data on their behalf' is set to 'No' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.9.md")
    }

    check "1.10" {
      title = "Ensure that 'Users can add gallery apps to their Access Panel' is set to 'No' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.10.md")
    }


    check "1.11" {
      title = "Ensure that 'Users can register applications' is set to 'No' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.11.md")
    }


    check "1.12" {
      title = "Ensure that 'Guest user permissions are limited' is set to 'Yes' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.12.md")
    }

    check "1.13" {
      title = "Ensure that 'Members can invite' is set to 'No' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.13.md")
    }

    check "1.14" {
      title = "Ensure that 'Guests can invite' is set to 'No' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.14.md")
    }

    check "1.15" {
      title = "Ensure that 'Restrict access to Azure AD administration portal' is set to 'Yes' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.15.md")
    }


    check "1.16" {
      title = "Ensure that 'Restrict user ability to access groups features in the Access Pane' is set to 'No' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.16.md")
    }


    check "1.17" {
      title = "Ensure that 'Users can create security groups in Azure Portals' is set to 'No' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.17.md")
    }

    check "1.18" {
      title = "Ensure that 'Owners can manage group membership requests in the Access Panel' is set to 'No' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.18.md")
    }

    check "1.19" {
      title = "Ensure that 'Users can create Microsoft 365 groups in Azure Portals' is set to 'No' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.19.md")
    }


    check "1.20" {
      title = "Ensure that 'Require Multi-Factor Auth to join devices' is set to 'Yes' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.20.md")
    }


    check "1.21" {
      title = "Ensure that no custom subscription owner roles are created (Automated)"
      query = file("queries/iam/custom_subscription_owner_roles.sql")
      doc   = file("cis_v1.3.0/docs/1.21.md")
    }

    check "1.22" {
      title = "Ensure Security Defaults is enabled on Azure Active Directory (Automated)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.22.md")
    }

    check "1.23" {
      title = "Ensure Custom Role is assigned for Administering Resource Locks (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/1.23.md")
    }
  }

  policy "2" {
    title = "Section 2"
    doc   = file("cis_v1.3.0/docs/2.md")

    view "azure_security_policy_parameters" {
      title = "GCP Log Metric Filter and Alarm"
      query = file("queries/security/policy_assignment_parameters.sql")
    }

    check "2.1" {
      title         = "Ensure that Azure Defender is set to On for Servers (Automatic)"
      expect_output = true
      query         = file("queries/security/defender_on_for_servers.sql")
      doc           = file("cis_v1.3.0/docs/2.1.md")
    }

    check "2.2" {
      title         = "Ensure that Azure Defender is set to On for App Service (Automatic)"
      expect_output = true
      query         = file("queries/security/defender_on_for_app_service.sql")
      doc           = file("cis_v1.3.0/docs/2.2.md")
    }

    check "2.3" {
      title         = "Ensure that Azure Defender is set to On for Azure SQL database servers (Automatic)"
      expect_output = true
      query         = file("queries/security/defender_on_for_sql_servers.sql")
      doc           = file("cis_v1.3.0/docs/2.3.md")
    }

    check "2.4" {
      title         = "Ensure that Azure Defender is set to On for SQL servers on machines (Automatic)"
      expect_output = true
      query         = file("queries/security/defender_on_for_sql_servers_on_machines.sql")
      doc           = file("cis_v1.3.0/docs/2.4.md")
    }


    check "2.5" {
      title         = "Ensure that Azure Defender is set to On for Storage (Automatic)"
      expect_output = true
      query         = file("queries/security/defender_on_for_storage.sql")
      doc           = file("cis_v1.3.0/docs/2.5.md")
    }

    check "2.6" {
      title         = "Ensure that Azure Defender is set to On for Kubernetes (Automatic)"
      expect_output = true
      query         = file("queries/security/defender_on_for_k8s.sql")
      doc           = file("cis_v1.3.0/docs/2.6.md")
    }

    check "2.7" {
      title         = "Ensure that Azure Defender is set to On for Container Registries (Automatic)"
      expect_output = true
      query         = file("queries/security/defender_on_for_container_registeries.sql")
      doc           = file("cis_v1.3.0/docs/2.7.md")
    }

    check "2.8" {
      title         = "Ensure that Azure Defender is set to On for Key Vault (Automatic)"
      expect_output = true
      query         = file("queries/security/defender_on_for_key_vault.sql")
      doc           = file("cis_v1.3.0/docs/2.8.md")
    }

    check "2.9" {
      title         = "Ensure that Windows Defender ATP (WDATP) integration with Security Center is selected (Automatic)"
      expect_output = true
      query         = file("queries/security/wdatp_integration_with_security_center_enabled.sql")
      doc           = file("cis_v1.3.0/docs/2.9.md")
    }

    check "2.10" {
      title         = "Ensure that Microsoft Cloud App Security (MCAS) integration with Security Center is selected (Automatic)"
      expect_output = true
      query         = file("queries/security/mcas_integration_with_security_center_enabled.sql")
      doc           = file("cis_v1.3.0/docs/2.10.md")
    }

    check "2.11" {
      title         = "Ensure that 'Automatic provisioning of monitoring agent' is set to 'On' (Automated)"
      expect_output = true
      query         = file("queries/security/auto_provisioning_monitoring_agent_enabled.sql")
      doc           = file("cis_v1.3.0/docs/2.11.md")
    }

    check "2.12" {
      title = "Ensure any of the ASC Default policy setting is not set to 'Disabled' (Automated)"
      query = file("queries/security/default_policy_disabled.sql")
      doc   = file("cis_v1.3.0/docs/2.12.md")
    }

    check "2.13" {
      title = "Ensure 'Additional email addresses' is configured with a security contact email (Automated)"
      //email should be valid so if there is even not valid email it will pass
      expect_output = true
      query         = file("queries/security/security_email_configured.sql")
      doc           = file("cis_v1.3.0/docs/2.13.md")
    }

    check "2.14" {
      title         = "Ensure that 'Notify about alerts with the following severity' is set to 'High' (Automated)"
      expect_output = true
      query         = file("queries/security/notify_high_severity_alerts.sql")
      doc           = file("cis_v1.3.0/docs/2.14.md")
    }

  }

  policy "azure-cis-section-4" {
    title = "Section 4"
    doc   = file("cis_v1.3.0/docs/4.md")

    check "4.1.1" {
      title = "4.1.1 Ensure that 'Auditing' is set to 'On' (Automated)"
      query = file("queries/sql/auditing_off.sql")
      doc   = file("cis_v1.3.0/docs/4.1.1.md")
    }

    check "4.1.2" {
      title = "4.1.2 Ensure that 'Data encryption' is set to 'On' on a SQL Database (Automated)"
      query = file("queries/sql/data_encryption_off.sql")
      doc   = file("cis_v1.3.0/docs/4.1.2.md")
    }

    check "4.1.3" {
      title = "4.1.3 Ensure that 'Auditing' Retention is 'greater than 90 days' (Automated)"
      query = file("queries/sql/auditing_retention_less_than_90_days.sql")
      doc   = file("cis_v1.3.0/docs/4.1.3.md")
    }

    check "4.2.1" {
      title = "4.2.1 Ensure that Advanced Threat Protection (ATP) on a SQL server is set to 'Enabled' (Automated)"
      query = file("queries/sql/atp_on_sql_server_disabled.sql")
      doc   = file("cis_v1.3.0/docs/4.2.1.md")
    }

    check "4.2.2" {
      title = "4.2.2 Ensure that Vulnerability Assessment (VA) is enabled on a SQL server by setting a Storage Account (Automated)"
      // experimentally checked and storage_container_path becomes NULL when storage account is disabled in assessment policy
      query = file("queries/sql/va_is_enabled_on_sql_server_by_storage_account.sql")
      doc   = file("cis_v1.3.0/docs/4.2.2.md")
    }


    check "4.2.3" {
      title = "4.2.3 Ensure that VA setting Periodic Recurring Scans is enabled on a SQL server (Automated)"
      query = file("queries/sql/va_periodic_scans_enabled_on_sql_server.sql")
      doc   = file("cis_v1.3.0/docs/4.2.3.md")
    }

    check "4.2.4" {
      title = "4.2.4 Ensure that VA setting Send scan reports to is configured for a SQL server (Automated)"
      query = file("queries/sql/va_send_scan_report_enabled_on_sql_server.sql")
      doc   = file("cis_v1.3.0/docs/4.2.4.md")
    }

    check "4.2.5" {
      title = "4.2.5 Ensure that VA setting 'Also send email notifications to admins and subscription owners' is set for a SQL server (Automated)"
      query = file("queries/sql/va_send_email_to_admins_and_owners_enabled.sql")
      doc   = file("cis_v1.3.0/docs/4.2.5.md")
    }

    check "4.3.1" {
      title = "4.3.1 Ensure 'Enforce SSL connection' is set to 'ENABLED' for PostgreSQL Database Server (Automated)"
      query = file("queries/sql/postgresql_ssl_enforcment_disabled.sql")
      doc   = file("cis_v1.3.0/docs/4.3.1.md")
    }

    check "4.3.2" {
      title = "4.3.2 Ensure 'Enforce SSL connection' is set to 'ENABLED' for MySQL Database Server (Automated)"
      query = file("queries/sql/mysql_ssl_enforcment_disabled.sql")
      doc   = file("cis_v1.3.0/docs/4.3.2.md")
    }


    check "4.3.3" {
      title = "4.3.3 Ensure server parameter 'log_checkpoints' is set to 'ON' for PostgreSQL Database Server (Automated)"
      query = file("queries/sql/postgresql_log_checkpoints_disabled.sql")
      doc   = file("cis_v1.3.0/docs/4.3.3.md")
    }

    check "4.3.4" {
      title = "4.3.4 Ensure server parameter 'log_connections' is set to 'ON' for PostgreSQL Database Server (Automated)"
      query = file("queries/sql/postgresql_log_connections_disabled.sql")
      doc   = file("cis_v1.3.0/docs/4.3.4.md")
    }

    check "4.3.5" {
      title = "4.3.5 Ensure server parameter 'log_disconnections' is set to 'ON' for PostgreSQL Database Server (Automated)"
      query = file("queries/sql/postgresql_log_disconnections_disabled.sql")
      doc   = file("cis_v1.3.0/docs/4.3.5.md")
    }

    check "4.3.6" {
      title = "4.3.6 Ensure server parameter 'connection_throttling' is set to 'ON' for PostgreSQL Database Server (Automated)"
      query = file("queries/sql/postgresql_connection_throttling_disabled.sql")
      doc   = file("cis_v1.3.0/docs/4.3.6.md")
    }

    check "4.3.7" {
      title = "4.3.7 Ensure server parameter 'log_retention_days' is greater than 3 days for PostgreSQL Database Server (Automated)"
      query = file("queries/sql/postgresql_log_retention_days_less_than_3_days.sql")
      doc   = file("cis_v1.3.0/docs/4.3.7.md")
    }

    check "4.3.8" {
      title = "4.3.8 Ensure 'Allow access to Azure services' for PostgreSQL Database Server is disabled (Automated)"
      query = file("queries/sql/postgresql_allow_access_to_azure_services_enabled.sql")
      doc   = file("cis_v1.3.0/docs/4.3.8.md")
    }

    check "4.4" {
      title = "Ensure that Azure Active Directory Admin is configured (Automated)"
      query = file("queries/sql/ad_admin_configured.sql")
      doc   = file("cis_v1.3.0/docs/4.4.md")
    }

    check "4.5" {
      title = "Ensure SQL server's TDE protector is encrypted with Customer-managed key (Automated)"
      query = file("queries/sql/sqlserver_tde_not_encrypted_with_cmek.sql")
      doc   = file("cis_v1.3.0/docs/4.5.md")
    }
  }

  policy "azure-cis-section-6" {
    title = "Section 6"
    doc   = file("cis_v1.3.0/docs/6.md")

    view "azure_nsg_rules" {
      title = "Azure network security groups rules with parsed ports"
      query = file("queries/network/nsg_rules_ports.sql")
    }

    check "6.1" {
      title = "Ensure that RDP access is restricted from the internet (Automated)"
      query = file("queries/network/rdp_access_permitted.sql")
      doc   = file("cis_v1.3.0/docs/6.1.md")
    }


    check "6.2" {
      title = "Ensure that SSH access is restricted from the internet (Automated)"
      query = file("queries/network/ssh_access_permitted.sql")
      doc   = file("cis_v1.3.0/docs/6.2.md")
    }

    check "6.3" {
      title = "Ensure no SQL Databases allow ingress 0.0.0.0/0 (ANY IP) (Automated)"
      //todo think about "other combinations which allows access to wider public IP ranges including Windows Azure IP ranges."
      query = file("queries/network/sql_database_allow_ingress.sql")
      doc   = file("cis_v1.3.0/docs/6.3.md")
    }

    check "6.4" {
      title = "Ensure that Network Security Group Flow Log retention period is 'greater than 90 days' (Automated)"
      query = file("queries/network/securtiy_group_flow_log_retention_less_than_90_days.sql")
      doc   = file("cis_v1.3.0/docs/6.4.md")
    }

    check "6.5" {
      title = "Ensure that Network Watcher is 'Enabled' (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/6.5.md")
    }

    check "6.6" {
      title = "Ensure that UDP Services are restricted from the Internet (Automated)"
      query = file("queries/network/udp_services_permitted.sql")
      doc   = file("cis_v1.3.0/docs/6.6.md")
    }
  }

  policy "azure-cis-section-7" {
    title = "Section 7"
    doc   = file("cis_v1.3.0/docs/7.md")

    check "7.1" {
      title = "Ensure Virtual Machines are utilizing Managed Disks (Manual)"
      query = file("queries/compute/vms_utilizing_managed_disks.sql")
      doc   = file("cis_v1.3.0/docs/7.1.md")
    }

    check "7.2" {
      title = "Ensure that 'OS and Data' disks are encrypted with CMK (Automated)"
      query = file("queries/compute/os_and_data_disks_encrypted_with_cmk.sql")
      doc   = file("cis_v1.3.0/docs/7.2.md")
    }

    check "7.3" {
      title = "Ensure that 'Unattached disks' are encrypted with CMK (Automated)"
      //todo maybe replace '%CustomerKey%' with 'EncryptionAtRestWithCustomerKey'
      query = file("queries/compute/unattached_disks_are_encrypted_with_cmk.sql")
      doc   = file("cis_v1.3.0/docs/7.3.md")
    }

    check "7.4" {
      title = "Ensure that only approved extensions are installed (Manual)"
      //      //todo we can list machines extensions names to ease manual check
      //      query = <<EOF
      //      SELECT v.id AS vm_id , v.name AS vm_name, r."name" AS extension_name
      //      FROM azure_compute_virtual_machines v
      //      JOIN azure_compute_virtual_machine_resources r ON
      //      v.cq_id = r.virtual_machine_cq_id
      //    EOF
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/7.4.md")
    }


    check "7.5" {
      title = "Ensure that the latest OS Patches for all Virtual Machines are applied (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/7.5.md")
    }


    check "7.6" {
      title = "Ensure that the endpoint protection for all Virtual Machines is installed (Manual)"
      //todo theoretically we can check if vm has security extensions but user also can have his own security extensions which we can't check
      //      EndpointSecurity || TrendMicroDSA* || Antimalware || EndpointProtection || SCWPAgent || PortalProtectExtension* || FileSecurity*
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/7.6.md")
    }

    check "7.7" {
      title = "Ensure that VHD's are encrypted (Manual)"
      query = file("queries/compute/vhds_not_encrypted.sql")
      doc   = file("cis_v1.3.0/docs/7.7.md")
    }
  }

  policy "azure-cis-section-8" {
    title = "Section 8"
    doc   = file("cis_v1.3.0/docs/8.md")

    check "8.1" {
      title = "Ensure that the expiration date is set on all keys (Automated)"
      query = file("queries/keyvault/keys_without_expiration_date.sql")
      doc   = file("cis_v1.3.0/docs/8.1.md")
    }

    check "8.2" {
      title = "Ensure that the expiration date is set on all Secrets (Automated)"
      query = file("queries/keyvault/secrets_without_expiration_date.sql")
      doc   = file("cis_v1.3.0/docs/8.2.md")
    }

    check "8.3" {
      title = "Ensure that Resource Locks are set for mission critical Azure resources (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/8.3.md")
    }

    check "8.4" {
      title = "Ensure the key vault is recoverable (Automated)"
      query = file("queries/keyvault/not_recoverable.sql")
      doc   = file("cis_v1.3.0/docs/8.4.md")
    }

    check "8.5" {
      title = "Enable role-based access control (RBAC) within Azure Kubernetes Services (Automated)"
      query = file("queries/keyvault/not_recoverable.sql")
      doc   = file("cis_v1.3.0/docs/8.5.md")
    }
  }


  policy "azure-cis-section-9" {
    title = "Section 9"
    doc   = file("cis_v1.3.0/docs/9.md")

    check "9.1" {
      title = "Ensure App Service Authentication is set on Azure App Service (Automated)"
      query = file("queries/web/app_auth_unset.sql")
      doc   = file("cis_v1.3.0/docs/9.1.md")
    }

    check "9.2" {
      title = "Ensure web app redirects all HTTP traffic to HTTPS in Azure App Service (Automated)"
      query = file("queries/web/app_allow_http.sql")
      doc   = file("cis_v1.3.0/docs/9.2.md")
    }

    check "9.3" {
      title = "Ensure web app is using the latest version of TLS encryption (Automated)"
      query = file("queries/web/app_using_old_tls.sql")
      doc   = file("cis_v1.3.0/docs/9.3.md")
    }

    check "9.4" {
      title = "Ensure the web app has 'Client Certificates (Incoming client certificates)' set to 'On' (Automated)"
      query = file("queries/web/app_client_cert_disabled.sql")
      doc   = file("cis_v1.3.0/docs/9.4.md")
    }

    check "9.5" {
      title = "Ensure that Register with Azure Active Directory is enabled on App Service (Automated)"
      query = file("queries/web/app_register_with_ad_disabled.sql")
      doc   = file("cis_v1.3.0/docs/9.5.md")
    }

    check "9.6" {
      title = "Ensure that 'PHP version' is the latest, if used to run the web app (Manual)"
      //we can check it but we need the latest php version. we can hardcode it here
      //todo we can show php version to ease check process
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/9.6.md")
    }

    check "9.7" {
      title = "Ensure that 'Python version' is the latest, if used to run the web app (Manual)"
      //we can check it but we need the latest php version. we can hardcode it here
      //todo we can show version to ease check process
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/9.7.md")
    }

    check "9.8" {
      title = "Ensure that 'Java version' is the latest, if used to run the web app (Manual)"
      //we can check it but we need the latest php version. we can hardcode it here
      //todo we can show version to ease check process
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/9.8.md")
    }


    check "9.9" {
      title = "Ensure that 'HTTP Version' is the latest, if used to run the web app (Manual)"
      //we can check it but we need the latest php version. we can hardcode it here
      //todo we can show version to ease check process
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/9.9.md")
    }

    check "9.10" {
      title = "Ensure FTP deployments are disabled (Automated)"
      query = file("queries/web/app_ftp_deployment_enabled.sql")
      doc   = file("cis_v1.3.0/docs/9.10.md")
    }

    check "9.11" {
      title = "Ensure Azure Keyvaults are used to store secrets (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.3.0/docs/9.11.md")
    }
  }
}