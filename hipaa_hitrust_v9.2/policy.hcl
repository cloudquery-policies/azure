policy "hipaa_hitrust_v9.2" {
  title = "v9.2 Policy"
  doc   = file("hipaa_hitrust_v9.2/README.md")

  configuration {
    provider "azure" {
      version = ">= 0.2.4"
    }
  }

  policy "privilege_management" {
    title = "Privilege Management"

    policy "11180_01c3system_6_01_c" {
      title = "Access to management functions or administrative consoles for systems hosting virtualized systems are restricted to personnel based upon the principle of least privilege and supported through technical controls."

      check "1" {
        title = "Management ports of virtual machines should be protected with just-in-time network access control"
        doc   = file("hipaa_hitrust_v9.2/docs/11180_01c3system_6_01_c_1.md")
        query = file("queries/compute/virtual_machines_without_jit_network_access_policy.sql")
      }
    }

    policy "1143_01c1system_123_01_c" {
      title = "Privileges are formally authorized and controlled, allocated to users on a need-to-use and event-by-event basis for their functional role (e.g., user or administrator), and documented for each system product/element."

      view "azure_nsg_rules" {
        title = "Azure network security groups rules with parsed ports"
        query = file("queries/network/nsg_rules_ports.sql")
      }

      check "1" {
        title = "Management ports should be closed on your virtual machines"
        doc   = file("hipaa_hitrust_v9.2/docs/1143_01c1system_123_01_c_1.md")
        query = file("queries/network/security_groups_with_open_management_ports.sql")
      }
    }

    policy "1144_01c1system_4_01_c" {
      title = "The organization explicitly authorizes access to specific security relevant functions (deployed in hardware, software, and firmware) and security-relevant information."

      check "1" {
        title = "A maximum of 3 owners should be designated for your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1144_01c1system_4_01_c_1.md")
        query = file("queries/authorization/subscriptions_with_more_than_3_owners.sql")
      }
    }

    policy "1145_01c2system_1_01_c" {
      title = "Role-based access control is implemented and capable of mapping each user to one or more roles, and each role to one or more system functions."

      check "1" {
        title = "There should be more than one owner assigned to your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1145_01c2system_1_01_c_1.md")
        query = file("queries/authorization/subscriptions_with_less_than_2_owners.sql")
      }
    }

    policy "1146_01c2system_23_01_c" {
      title = "The organization promotes the development and use of programs that avoid the need to run with elevated privileges and system routines to avoid the need to grant privileges to users."

      check "1" {
        title = "External accounts with owner permissions should be removed from your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1146_01c2system_23_01_c_1.md")
        query = file("queries/security/external_accounts_with_owner_permissions_should_be_removed_from_your_subscription.sql")
      }
    }

    policy "1147_01c2system_456_01_c" {
      title = "Elevated privileges are assigned to a different user ID from those used for normal business use, all users access privileged services in a single role, and such privileged access is minimized."

      check "1" {
        title = "Deprecated accounts with owner permissions should be removed from your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1147_01c2system_456_01_c_1.md")
        query = file("queries/security/deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription.sql")
      }
    }

    policy "1148_01c2system_78_01_c" {
      title = "The organization restricts access to privileged functions and all security-relevant information."

      check "1" {
        title = "Audit usage of custom RBAC rules"
        doc   = file("hipaa_hitrust_v9.2/docs/1148_01c2system_78_01_c_1.md")
        query = file("queries/authorization/custom_roles.sql")
      }

      check "2" {
        title = "Windows machines should meet requirements for 'Security Options_Accounts'"
        doc   = file("hipaa_hitrust_v9.2/docs/1148_01c2system_78_01_c_2.md")
        query = file("queries/manual.sql") # todo
      }
    }

    policy "1149_01c2system_9_01_c" {
      title = "The organization facilitates information sharing by enabling authorized users to determine a business partner's access when discretion is allowed as defined by the organization and by employing manual processes or automated mechanisms to assist users in making information sharing/collaboration decisions."

      check "1" {
        title = "Role-Based Access Control (RBAC) should be used on Kubernetes Services"
        doc   = file("hipaa_hitrust_v9.2/docs/1149_01c2system_9_01_c_1.md")
        query = file("queries/container/aks_rbac_disabled.sql")
      }
    }

    policy "1150_01c2system_10_01_c" {
      title = "The access control system for the system components storing, processing or transmitting covered information is set with a default \"deny-all\" setting."

      view "azure_nsg_rules" {
        title = "Azure network security groups rules with parsed ports"
        query = file("queries/network/nsg_rules_ports.sql")
      }

      check "1" {
        title = "Management ports should be closed on your virtual machines"
        doc   = file("hipaa_hitrust_v9.2/docs/1150_01c2system_10_01_c_1.md")
        query = file("queries/network/security_groups_with_open_management_ports.sql")
      }
    }

    policy "1151_01c3system_1_01_c" {
      title = "The organization limits authorization to privileged accounts on information systems to a pre-defined subset of users."

      check "1" {
        title = "A maximum of 3 owners should be designated for your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1151_01c3system_1_01_c_1.md")
        query = file("queries/authorization/subscriptions_with_more_than_3_owners.sql")
      }
    }

    policy "1152_01c3system_2_01_c" {
      title = "The organization audits the execution of privileged functions on information systems and ensures information systems prevent non-privileged users from executing privileged functions."

      check "1" {
        title = "There should be more than one owner assigned to your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1152_01c3system_2_01_c_1.md")
        query = file("queries/authorization/subscriptions_with_less_than_2_owners.sql")
      }
    }

    policy "1153_01c3system_35_01_c" {
      title = "All file system access not explicitly required is disabled, and only authorized users are permitted access to only that which is expressly required for the performance of the users' job duties."

      check "1" {
        title = "Role-Based Access Control (RBAC) should be used on Kubernetes Services"
        doc   = file("hipaa_hitrust_v9.2/docs/1153_01c3system_35_01_c_1.md")
        query = file("queries/container/aks_rbac_disabled.sql")
      }
    }

    policy "1154_01c3system_4_01_c" {
      title = "Contractors are provided with minimal system and physical access only after the organization assesses the contractor's ability to comply with its security requirements and the contractor agrees to comply."

      check "1" {
        title = "A maximum of 3 owners should be designated for your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1154_01c3system_4_01_c_1.md")
        query = file("queries/authorization/subscriptions_with_more_than_3_owners.sql")
      }
    }
  }

  policy "user_authentication_for_external_connections" {
    title = "User Authentication for External Connections"

    policy "1116_01j1organizational_145_01_j" {
      title = "Strong authentication methods such as multi-factor, Radius or Kerberos (for privileged access) and CHAP (for encryption of credentials for dialup methods) are implemented for all external connections to the organizations network."

      check "1" {
        title = "MFA should be enabled on accounts with owner permissions on your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1116_01j1organizational_145_01_j_1.md")
        query = file("queries/security/mfa_should_be_enabled_on_accounts_with_owner_permissions_on_your_subscription.sql")
      }
    }

    policy "1117_01j1organizational_23_01_j" {
      title = "Remote access by vendors and business partners (e.g., for remote maintenance) is disabled/deactivated when not in use."

      check "1" {
        title = "MFA should be enabled accounts with write permissions on your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1117_01j1organizational_23_01_j_1.md")
        query = file("queries/security/mfa_should_be_enabled_accounts_with_write_permissions_on_your_subscription.sql")
      }
    }

    policy "1118_01j2organizational_124_01_j" {
      title = "Organizations implement encryption (e.g.  VPN solutions or private lines) and logs remote access to the organization's network by employees, contractors or third party (e.g., vendors)."

      check "1" {
        title = "MFA should be enabled on accounts with read permissions on your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1118_01j2organizational_124_01_j_1.md")
        query = file("queries/security/mfa_should_be_enabled_on_accounts_with_read_permissions_on_your_subscription.sql")
      }
    }

    policy "1119_01j2organizational_3_01_j" {
      title = "Network equipment is checked for unanticipated dial-up capabilities."

      check "1" {
        title = "Management ports of virtual machines should be protected with just-in-time network access control"
        doc   = file("hipaa_hitrust_v9.2/docs/1119_01j2organizational_3_01_j_1.md")
        query = file("queries/compute/virtual_machines_without_jit_network_access_policy.sql")
      }
    }

    policy "1121_01j3organizational_2_01_j" {
      title = "Remote administration sessions are authorized, encrypted, and employ increased security measures."

      check "1" {
        title = "MFA should be enabled on accounts with owner permissions on your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1121_01j3organizational_2_01_j_1.md")
        query = file("queries/security/mfa_should_be_enabled_on_accounts_with_owner_permissions_on_your_subscription.sql")
      }
    }

    policy "1173_01j1organizational_6_01_j" {
      title = "If encryption is not used for dial-up connections, the CIO or his/her designated representative provides specific written authorization."

      check "1" {
        title = "MFA should be enabled accounts with write permissions on your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1173_01j1organizational_6_01_j_1.md")
        query = file("queries/security/mfa_should_be_enabled_accounts_with_write_permissions_on_your_subscription.sql")
      }
    }

    policy "1174_01j1organizational_7_01_j" {
      title = "The organization protects wireless access to systems containing sensitive information by authenticating both users and devices."

      check "1" {
        title = "MFA should be enabled on accounts with read permissions on your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1174_01j1organizational_7_01_j_1.md")
        query = file("queries/security/mfa_should_be_enabled_on_accounts_with_read_permissions_on_your_subscription.sql")
      }
    }

    policy "1175_01j1organizational_8_01_j" {
      title = "Remote access to business information across public networks only takes place after successful identification and authentication."

      check "1" {
        title = "Management ports of virtual machines should be protected with just-in-time network access control"
        doc   = file("hipaa_hitrust_v9.2/docs/1175_01j1organizational_8_01_j_1.md")
        query = file("queries/compute/virtual_machines_without_jit_network_access_policy.sql")
      }
    }

    policy "1176_01j2organizational_5_01_j" {
      title = "The organization requires a callback capability with re-authentication to verify dial-up connections from authorized locations."

      check "1" {
        title = "MFA should be enabled on accounts with owner permissions on your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1176_01j2organizational_5_01_j_1.md")
        query = file("queries/security/mfa_should_be_enabled_on_accounts_with_owner_permissions_on_your_subscription.sql")
      }
    }

    policy "1177_01j2organizational_6_01_j" {
      title = "User IDs assigned to vendors are reviewed in accordance with the organization's access review policy, at a minimum annually."

      check "1" {
        title = "MFA should be enabled accounts with write permissions on your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1177_01j2organizational_6_01_j_1.md")
        query = file("queries/security/mfa_should_be_enabled_accounts_with_write_permissions_on_your_subscription.sql")
      }
    }

    policy "1178_01j2organizational_7_01_j" {
      title = "Node authentication, including cryptographic techniques (e.g., machine certificates), serves as an alternative means of authenticating groups of remote users where they are connected to a secure, shared computer facility."

      check "1" {
        title = "MFA should be enabled on accounts with read permissions on your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1178_01j2organizational_7_01_j_1.md")
        query = file("queries/security/mfa_should_be_enabled_on_accounts_with_read_permissions_on_your_subscription.sql")
      }
    }

    policy "1179_01j3organizational_1_01_j" {
      title = "The information system monitors and controls remote access methods."

      check "1" {
        title = "Management ports of virtual machines should be protected with just-in-time network access control"
        doc   = file("hipaa_hitrust_v9.2/docs/1179_01j3organizational_1_01_j_1.md")
        query = file("queries/compute/virtual_machines_without_jit_network_access_policy.sql")
      }
    }
  }

  policy "remote_diagnostic_and_configuration_port_protection" {
    title = "Remote Diagnostic and Configuration Port Protection"

    policy "1192_01l1organizational_1_01_l" {
      title = "Access to network equipment is physically protected."

      check "1" {
        title = "Management ports of virtual machines should be protected with just-in-time network access control"
        doc   = file("hipaa_hitrust_v9.2/docs/1192_01l1organizational_1_01_l_1.md")
        query = file("queries/compute/virtual_machines_without_jit_network_access_policy.sql")
      }
    }

    policy "1193_01l2organizational_13_01_l" {
      title = "Controls for the access to diagnostic and configuration ports include the use of a key lock and the implementation of supporting procedures to control physical access to the port."

      view "azure_nsg_rules" {
        title = "Azure network security groups rules with parsed ports"
        query = file("queries/network/nsg_rules_ports.sql")
      }

      check "1" {
        title = "Management ports should be closed on your virtual machines"
        doc   = file("hipaa_hitrust_v9.2/docs/1193_01l2organizational_13_01_l_1.md")
        query = file("queries/network/security_groups_with_open_management_ports.sql")
      }
    }

    policy "1194_01l2organizational_2_01_l" {
      title = "Ports, services, and similar applications installed on a computer or network systems, which are not specifically required for business functionality, are disabled or removed."

      check "1" {
        title = "Remote debugging should be turned off for Web Applications"
        doc   = file("hipaa_hitrust_v9.2/docs/1194_01l2organizational_2_01_l_1.md")
        query = file("queries/web/remote_debugging_should_be_turned_off_for_web_applications.sql")
      }
    }

    policy "1195_01l3organizational_1_01_l" {
      title = "The organization reviews the information system within every three hundred and sixty- five (365) days to identify and disables unnecessary and non-secure functions, ports, protocols, and/or services."

      check "1" {
        title = "Remote debugging should be turned off for Function Apps"
        doc   = file("hipaa_hitrust_v9.2/docs/1195_01l3organizational_1_01_l_1.md")
        query = file("queries/web/remote_debugging_should_be_turned_off_for_function_apps.sql")
      }
    }

    policy "1196_01l3organizational_24_01_l" {
      title = "The organization identifies unauthorized (blacklisted) software on the information system, prevents program execution in accordance with a list of unauthorized (blacklisted) software programs, employs an allow-all, deny-by exception policy to prohibit execution of known unauthorized (blacklisted) software, and reviews and updates the list of unauthorized (blacklisted) software programs annually."

      check "1" {
        title = "Remote debugging should be turned off for API Apps"
        doc   = file("hipaa_hitrust_v9.2/docs/1196_01l3organizational_24_01_l_1.md")
        query = file("queries/web/remote_debugging_should_be_turned_off_for_api_apps.sql")
      }
    }

    policy "1197_01l3organizational_3_01_l" {
      title = "The organization disables Bluetooth and peer-to-peer networking protocols within the information system determined to be unnecessary or non-secure."

      check "1" {
        title = "Adaptive application controls for defining safe applications should be enabled on your machines"
        doc   = file("hipaa_hitrust_v9.2/docs/1197_01l3organizational_3_01_l_1.md")
        query = file("queries/manual.sql")
      }
    }
  }

  policy "segregation_in_networks" {
    title = "Segregation in Networks"

    policy "0805_01m1organizational_12_01_m" {
      title = "The organization's security gateways (e.g. firewalls) enforce security policies and are configured to filter traffic between domains, block unauthorized access, and are used to maintain segregation between internal wired, internal wireless, and external network segments (e.g., the Internet) including DMZs and enforce access control policies for each of the domains."

      check "1" {
        title = "[Preview]: Container Registry should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0805_01m1organizational_12_01_m_1.md")
        query = file("queries/container/containers_without_virtual_service_endpoint.sql")
      }

      check "2" {
        title = "App Service should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0805_01m1organizational_12_01_m_2.md")
        query = file("queries/network/virtualnetworkserviceendpoint_appservice_auditifnotexists.sql")
      }

      check "3" {
        title = "Cosmos DB should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0805_01m1organizational_12_01_m_3.md")
        query = file("queries/cosmosdb/cosmos_db_should_use_a_virtual_network_service_endpoint.sql")
      }

      check "4" {
        title = "Event Hub should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0805_01m1organizational_12_01_m_4.md")
        query = file("queries/eventhub/event_hub_should_use_a_virtual_network_service_endpoint.sql")
      }

      check "5" {
        title = "Gateway subnets should not be configured with a network security group"
        doc   = file("hipaa_hitrust_v9.2/docs/0805_01m1organizational_12_01_m_5.md")
        query = file("queries/network/gateway_subnets_should_not_be_configured_with_a_network_security_group.sql")
      }

      check "6" {
        title = "Internet-facing virtual machines should be protected with network security groups"
        doc   = file("hipaa_hitrust_v9.2/docs/0805_01m1organizational_12_01_m_6.md")
        query = file("queries/compute/internet-facing_virtual_machines_should_be_protected_with_network_security_groups.sql")
      }

      check "7" {
        title = "Key Vault should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0805_01m1organizational_12_01_m_7.md")
        query = file("queries/keyvault/vaults_with_no_service_endpoint.sql")
      }

      check "8" {
        title = "SQL Server should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0805_01m1organizational_12_01_m_8.md")
        query = file("queries/sql/sql_servers_with_no_service_endpoint.sql")
      }

      check "9" {
        title = "Storage Accounts should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0805_01m1organizational_12_01_m_9.md")
        query = file("queries/storage/accounts_with_no_service_endpoint_associated.sql")
      }

      check "10" {
        title = "Subnets should be associated with a Network Security Group"
        doc   = file("hipaa_hitrust_v9.2/docs/0805_01m1organizational_12_01_m_10.md")
        query = file("queries/network/subnets_without_nsg_associated.sql")
      }

      check "11" {
        title = "Virtual machines should be connected to an approved virtual network"
        doc   = file("hipaa_hitrust_v9.2/docs/0805_01m1organizational_12_01_m_11.md")
        query = file("queries/compute/vms_without_approved_networks.sql")
      }
    }

    policy "0806_01m2organizational_12356_01_m" {
      title = "The organizations network is logically and physically segmented with a defined security perimeter and a graduated set of controls, including subnetworks for publicly accessible system components that are logically separated from the internal network, based on organizational requirements; and traffic is controlled based on functionality required and classification of the data/systems based on a risk assessment and their respective security requirements."

      check "1" {
        title = "[Preview]: Container Registry should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0806_01m2organizational_12356_01_m_1.md")
        query = file("queries/container/containers_without_virtual_service_endpoint.sql")
      }

      check "2" {
        title = "App Service should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0806_01m2organizational_12356_01_m_2.md")
        query = file("queries/network/virtualnetworkserviceendpoint_appservice_auditifnotexists.sql")
      }

      check "3" {
        title = "Cosmos DB should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0806_01m2organizational_12356_01_m_3.md")
        query = file("queries/cosmosdb/cosmos_db_should_use_a_virtual_network_service_endpoint.sql")
      }

      check "4" {
        title = "Event Hub should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0806_01m2organizational_12356_01_m_4.md")
        query = file("queries/eventhub/event_hub_should_use_a_virtual_network_service_endpoint.sql")
      }

      check "5" {
        title = "Gateway subnets should not be configured with a network security group"
        doc   = file("hipaa_hitrust_v9.2/docs/0806_01m2organizational_12356_01_m_5.md")
        query = file("queries/manual.sql")
      }

      check "6" {
        title = "Internet-facing virtual machines should be protected with network security groups"
        doc   = file("hipaa_hitrust_v9.2/docs/0806_01m2organizational_12356_01_m_6.md")
        query = file("queries/compute/internet-facing_virtual_machines_should_be_protected_with_network_security_groups.sql")
      }

      check "7" {
        title = "Key Vault should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0806_01m2organizational_12356_01_m_7.md")
        query = file("queries/keyvault/vaults_with_no_service_endpoint.sql")
      }

      check "8" {
        title = "SQL Server should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0806_01m2organizational_12356_01_m_8.md")
        query = file("queries/manual.sql")
      }

      check "9" {
        title = "Storage Accounts should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0806_01m2organizational_12356_01_m_9.md")
        query = file("queries/storage/accounts_with_no_service_endpoint_associated.sql")
      }

      check "10" {
        title = "Subnets should be associated with a Network Security Group"
        doc   = file("hipaa_hitrust_v9.2/docs/0806_01m2organizational_12356_01_m_10.md")
        query = file("queries/network/subnets_without_nsg_associated.sql")
      }

      check "11" {
        title = "Virtual machines should be connected to an approved virtual network"
        doc   = file("hipaa_hitrust_v9.2/docs/0806_01m2organizational_12356_01_m_11.md")
        query = file("queries/compute/vms_without_approved_networks.sql")
      }
    }

    policy "0894_01m2organizational_7_01_m" {
      title = "Networks are segregated from production-level networks when migrating physical servers, applications or data to virtualized servers."

      check "1" {
        title = "[Preview]: Container Registry should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0894_01m2organizational_7_01_m_1.md")
        query = file("queries/container/containers_without_virtual_service_endpoint.sql")
      }

      check "2" {
        title = "App Service should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0894_01m2organizational_7_01_m_2.md")
        query = file("queries/network/virtualnetworkserviceendpoint_appservice_auditifnotexists.sql")
      }

      check "3" {
        title = "Cosmos DB should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0894_01m2organizational_7_01_m_3.md")
        query = file("queries/cosmosdb/cosmos_db_should_use_a_virtual_network_service_endpoint.sql")
      }

      check "4" {
        title = "Event Hub should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0894_01m2organizational_7_01_m_4.md")
        query = file("queries/eventhub/event_hub_should_use_a_virtual_network_service_endpoint.sql")
      }

      check "5" {
        title = "Gateway subnets should not be configured with a network security group"
        doc   = file("hipaa_hitrust_v9.2/docs/0894_01m2organizational_7_01_m_5.md")
        query = file("queries/manual.sql")
      }

      check "6" {
        title = "Internet-facing virtual machines should be protected with network security groups"
        doc   = file("hipaa_hitrust_v9.2/docs/0894_01m2organizational_7_01_m_6.md")
        query = file("queries/compute/internet-facing_virtual_machines_should_be_protected_with_network_security_groups.sql")
      }

      check "7" {
        title = "Key Vault should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0894_01m2organizational_7_01_m_7.md")
        query = file("queries/keyvault/vaults_with_no_service_endpoint.sql")
      }

      check "8" {
        title = "SQL Server should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0894_01m2organizational_7_01_m_8.md")
        query = file("queries/manual.sql")
      }

      check "9" {
        title = "Storage Accounts should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0894_01m2organizational_7_01_m_9.md")
        query = file("queries/storage/accounts_with_no_service_endpoint_associated.sql")
      }

      check "10" {
        title = "Subnets should be associated with a Network Security Group"
        doc   = file("hipaa_hitrust_v9.2/docs/0894_01m2organizational_7_01_m_10.md")
        query = file("queries/network/subnets_without_nsg_associated.sql")
      }

      check "11" {
        title = "Virtual machines should be connected to an approved virtual network"
        doc   = file("hipaa_hitrust_v9.2/docs/0894_01m2organizational_7_01_m_11.md")
        query = file("queries/compute/vms_without_approved_networks.sql")
      }

      check "12" {
        title = "Deploy network watcher when virtual networks are created"
        doc   = file("hipaa_hitrust_v9.2/docs/0894_01m2organizational_7_01_m_12.md")
        query = file("queries/network/networkwatcher_deploy.sql")
      }
    }
  }

  policy "network_connection_control" {
    title = "Network Connection Control"

    policy "0809_01n2organizational_1234_01_n" {
      title = "Network traffic is controlled in accordance with the organizations access control policy through firewall and other network-related restrictions for each network access point or external telecommunication service's managed interface."

      check "1" {
        title = "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
        doc   = file("hipaa_hitrust_v9.2/docs/0809_01n2organizational_1234_01_n_1.md")
        query = file("queries/manual.sql")
      }

      check "2" {
        title = "API App should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0809_01n2organizational_1234_01_n_2.md")
        query = file("queries/web/api_app_should_only_be_accessible_over_https.sql")
      }

      check "3" {
        title = "Enforce SSL connection should be enabled for MySQL database servers"
        doc   = file("hipaa_hitrust_v9.2/docs/0809_01n2organizational_1234_01_n_3.md")
        query = file("queries/mysql/enforce_ssl_connection_should_be_enabled_for_mysql_database_servers.sql")
      }

      check "4" {
        title = "Enforce SSL connection should be enabled for PostgreSQL database servers"
        doc   = file("hipaa_hitrust_v9.2/docs/0809_01n2organizational_1234_01_n_4.md")
        query = file("queries/postgresql/enforce_ssl_connection_should_be_enabled_for_postgresql_database_servers.sql")
      }

      check "5" {
        title = "Function App should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0809_01n2organizational_1234_01_n_5.md")
        query = file("queries/web/function_app_should_only_be_accessible_over_https.sql")
      }

      check "6" {
        title = "Internet-facing virtual machines should be protected with network security groups"
        doc   = file("hipaa_hitrust_v9.2/docs/0809_01n2organizational_1234_01_n_6.md")
        query = file("queries/compute/internet-facing_virtual_machines_should_be_protected_with_network_security_groups.sql")
      }

      check "7" {
        title = "Latest TLS version should be used in your API App"
        doc   = file("hipaa_hitrust_v9.2/docs/0809_01n2organizational_1234_01_n_7.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_api_app.sql")
      }

      check "8" {
        title = "Latest TLS version should be used in your Function App"
        doc   = file("hipaa_hitrust_v9.2/docs/0809_01n2organizational_1234_01_n_8.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_function_app.sql")
      }

      check "9" {
        title = "Latest TLS version should be used in your Web App"
        doc   = file("hipaa_hitrust_v9.2/docs/0809_01n2organizational_1234_01_n_9.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_web_app.sql")
      }

      check "10" {
        title = "Only secure connections to your Azure Cache for Redis should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/0809_01n2organizational_1234_01_n_10.md")
        query = file("queries/redis/only_secure_connections_to_your_azure_cache_for_redis_should_be_enabled.sql")
      }

      check "11" {
        title = "Secure transfer to storage accounts should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/0809_01n2organizational_1234_01_n_11.md")
        query = file("queries/storage/secure_transfer_to_storage_accounts_should_be_enabled.sql")
      }

      check "12" {
        title = "Subnets should be associated with a Network Security Group"
        doc   = file("hipaa_hitrust_v9.2/docs/0809_01n2organizational_1234_01_n_12.md")
        query = file("queries/network/subnets_without_nsg_associated.sql")
      }

      check "13" {
        title = "Virtual machines should be connected to an approved virtual network"
        doc   = file("hipaa_hitrust_v9.2/docs/0809_01n2organizational_1234_01_n_13.md")
        query = file("queries/compute/vms_without_approved_networks.sql")
      }

      check "14" {
        title = "Web Application should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0809_01n2organizational_1234_01_n_14.md")
        query = file("queries/web/web_application_should_only_be_accessible_over_https.sql")
      }
    }

    policy "0810_01n2organizational_5_01_n" {
      title = "Transmitted information is secured and, at a minimum, encrypted over open, public networks."

      check "1" {
        title = "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
        doc   = file("hipaa_hitrust_v9.2/docs/0810_01n2organizational_5_01_n_1.md")
        query = file("queries/manual.sql")
      }

      check "2" {
        title = "API App should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0810_01n2organizational_5_01_n_2.md")
        query = file("queries/web/api_app_should_only_be_accessible_over_https.sql")
      }

      check "3" {
        title = "Enforce SSL connection should be enabled for MySQL database servers"
        doc   = file("hipaa_hitrust_v9.2/docs/0810_01n2organizational_5_01_n_3.md")
        query = file("queries/mysql/enforce_ssl_connection_should_be_enabled_for_mysql_database_servers.sql")
      }

      check "4" {
        title = "Enforce SSL connection should be enabled for PostgreSQL database servers"
        doc   = file("hipaa_hitrust_v9.2/docs/0810_01n2organizational_5_01_n_4.md")
        query = file("queries/postgresql/enforce_ssl_connection_should_be_enabled_for_postgresql_database_servers.sql")
      }

      check "5" {
        title = "Function App should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0810_01n2organizational_5_01_n_5.md")
        query = file("queries/web/function_app_should_only_be_accessible_over_https.sql")
      }

      check "6" {
        title = "Internet-facing virtual machines should be protected with network security groups"
        doc   = file("hipaa_hitrust_v9.2/docs/0810_01n2organizational_5_01_n_6.md")
        query = file("queries/compute/internet-facing_virtual_machines_should_be_protected_with_network_security_groups.sql")
      }

      check "7" {
        title = "Latest TLS version should be used in your API App"
        doc   = file("hipaa_hitrust_v9.2/docs/0810_01n2organizational_5_01_n_7.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_api_app.sql")
      }

      check "8" {
        title = "Latest TLS version should be used in your Function App"
        doc   = file("hipaa_hitrust_v9.2/docs/0810_01n2organizational_5_01_n_8.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_function_app.sql")
      }

      check "9" {
        title = "Latest TLS version should be used in your Web App"
        doc   = file("hipaa_hitrust_v9.2/docs/0810_01n2organizational_5_01_n_9.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_web_app.sql")
      }

      check "10" {
        title = "Only secure connections to your Azure Cache for Redis should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/0810_01n2organizational_5_01_n_10.md")
        query = file("queries/redis/only_secure_connections_to_your_azure_cache_for_redis_should_be_enabled.sql")
      }

      check "11" {
        title = "Secure transfer to storage accounts should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/0810_01n2organizational_5_01_n_11.md")
        query = file("queries/storage/secure_transfer_to_storage_accounts_should_be_enabled.sql")
      }

      check "12" {
        title = "Subnets should be associated with a Network Security Group"
        doc   = file("hipaa_hitrust_v9.2/docs/0810_01n2organizational_5_01_n_12.md")
        query = file("queries/network/subnets_without_nsg_associated.sql")
      }

      check "13" {
        title = "Virtual machines should be connected to an approved virtual network"
        doc   = file("hipaa_hitrust_v9.2/docs/0810_01n2organizational_5_01_n_13.md")
        query = file("queries/compute/vms_without_approved_networks.sql")
      }

      check "14" {
        title = "Web Application should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0810_01n2organizational_5_01_n_14.md")
        query = file("queries/web/web_application_should_only_be_accessible_over_https.sql")
      }
    }

    policy "0811_01n2organizational_6_01_n" {
      title = "Exceptions to the traffic flow policy are documented with a supporting mission/business need, duration of the exception, and reviewed at least annually; traffic flow policy exceptions are removed when no longer supported by an explicit mission/business need."

      check "1" {
        title = "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
        doc   = file("hipaa_hitrust_v9.2/docs/0811_01n2organizational_6_01_n_1.md")
        query = file("queries/manual.sql")
      }

      check "2" {
        title = "API App should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0811_01n2organizational_6_01_n_2.md")
        query = file("queries/web/api_app_should_only_be_accessible_over_https.sql")
      }

      check "3" {
        title = "Enforce SSL connection should be enabled for MySQL database servers"
        doc   = file("hipaa_hitrust_v9.2/docs/0811_01n2organizational_6_01_n_3.md")
        query = file("queries/mysql/enforce_ssl_connection_should_be_enabled_for_mysql_database_servers.sql")
      }

      check "4" {
        title = "Enforce SSL connection should be enabled for PostgreSQL database servers"
        doc   = file("hipaa_hitrust_v9.2/docs/0811_01n2organizational_6_01_n_4.md")
        query = file("queries/postgresql/enforce_ssl_connection_should_be_enabled_for_postgresql_database_servers.sql")
      }

      check "5" {
        title = "Function App should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0811_01n2organizational_6_01_n_5.md")
        query = file("queries/web/function_app_should_only_be_accessible_over_https.sql")
      }

      check "6" {
        title = "Internet-facing virtual machines should be protected with network security groups"
        doc   = file("hipaa_hitrust_v9.2/docs/0811_01n2organizational_6_01_n_6.md")
        query = file("queries/compute/internet-facing_virtual_machines_should_be_protected_with_network_security_groups.sql")
      }

      check "7" {
        title = "Latest TLS version should be used in your API App"
        doc   = file("hipaa_hitrust_v9.2/docs/0811_01n2organizational_6_01_n_7.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_api_app.sql")
      }

      check "8" {
        title = "Latest TLS version should be used in your Function App"
        doc   = file("hipaa_hitrust_v9.2/docs/0811_01n2organizational_6_01_n_8.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_function_app.sql")
      }

      check "9" {
        title = "Latest TLS version should be used in your Web App"
        doc   = file("hipaa_hitrust_v9.2/docs/0811_01n2organizational_6_01_n_9.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_web_app.sql")
      }

      check "10" {
        title = "Only secure connections to your Azure Cache for Redis should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/0811_01n2organizational_6_01_n_10.md")
        query = file("queries/redis/only_secure_connections_to_your_azure_cache_for_redis_should_be_enabled.sql")
      }

      check "11" {
        title = "Secure transfer to storage accounts should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/0811_01n2organizational_6_01_n_11.md")
        query = file("queries/storage/secure_transfer_to_storage_accounts_should_be_enabled.sql")
      }

      check "12" {
        title = "Subnets should be associated with a Network Security Group"
        doc   = file("hipaa_hitrust_v9.2/docs/0811_01n2organizational_6_01_n_12.md")
        query = file("queries/network/subnets_without_nsg_associated.sql")
      }

      check "13" {
        title = "Virtual machines should be connected to an approved virtual network"
        doc   = file("hipaa_hitrust_v9.2/docs/0811_01n2organizational_6_01_n_13.md")
        query = file("queries/compute/vms_without_approved_networks.sql")
      }

      check "14" {
        title = "Web Application should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0811_01n2organizational_6_01_n_14.md")
        query = file("queries/web/web_application_should_only_be_accessible_over_https.sql")
      }
    }

    policy "0812_01n2organizational_8_01_n" {
      title = "Remote devices establishing a non-remote connection are not allowed to communicate with external (remote) resources."

      check "1" {
        title = "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
        doc   = file("hipaa_hitrust_v9.2/docs/0812_01n2organizational_8_01_n_1.md")
        query = file("queries/manual.sql")
      }

      check "2" {
        title = "API App should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0812_01n2organizational_8_01_n_2.md")
        query = file("queries/web/api_app_should_only_be_accessible_over_https.sql")
      }

      check "3" {
        title = "Enforce SSL connection should be enabled for MySQL database servers"
        doc   = file("hipaa_hitrust_v9.2/docs/0812_01n2organizational_8_01_n_3.md")
        query = file("queries/mysql/enforce_ssl_connection_should_be_enabled_for_mysql_database_servers.sql")
      }

      check "4" {
        title = "Enforce SSL connection should be enabled for PostgreSQL database servers"
        doc   = file("hipaa_hitrust_v9.2/docs/0812_01n2organizational_8_01_n_4.md")
        query = file("queries/postgresql/enforce_ssl_connection_should_be_enabled_for_postgresql_database_servers.sql")
      }

      check "5" {
        title = "Function App should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0812_01n2organizational_8_01_n_5.md")
        query = file("queries/web/function_app_should_only_be_accessible_over_https.sql")
      }

      check "6" {
        title = "Internet-facing virtual machines should be protected with network security groups"
        doc   = file("hipaa_hitrust_v9.2/docs/0812_01n2organizational_8_01_n_6.md")
        query = file("queries/compute/internet-facing_virtual_machines_should_be_protected_with_network_security_groups.sql")
      }

      check "7" {
        title = "Latest TLS version should be used in your API App"
        doc   = file("hipaa_hitrust_v9.2/docs/0812_01n2organizational_8_01_n_7.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_api_app.sql")
      }

      check "8" {
        title = "Latest TLS version should be used in your Function App"
        doc   = file("hipaa_hitrust_v9.2/docs/0812_01n2organizational_8_01_n_8.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_function_app.sql")
      }

      check "9" {
        title = "Latest TLS version should be used in your Web App"
        doc   = file("hipaa_hitrust_v9.2/docs/0812_01n2organizational_8_01_n_9.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_web_app.sql")
      }

      check "10" {
        title = "Only secure connections to your Azure Cache for Redis should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/0812_01n2organizational_8_01_n_10.md")
        query = file("queries/redis/only_secure_connections_to_your_azure_cache_for_redis_should_be_enabled.sql")
      }

      check "11" {
        title = "Secure transfer to storage accounts should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/0812_01n2organizational_8_01_n_11.md")
        query = file("queries/storage/secure_transfer_to_storage_accounts_should_be_enabled.sql")
      }

      check "12" {
        title = "Subnets should be associated with a Network Security Group"
        doc   = file("hipaa_hitrust_v9.2/docs/0812_01n2organizational_8_01_n_12.md")
        query = file("queries/network/subnets_without_nsg_associated.sql")
      }

      check "13" {
        title = "Virtual machines should be connected to an approved virtual network"
        doc   = file("hipaa_hitrust_v9.2/docs/0812_01n2organizational_8_01_n_13.md")
        query = file("queries/compute/vms_without_approved_networks.sql")
      }

      check "14" {
        title = "Web Application should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0812_01n2organizational_8_01_n_14.md")
        query = file("queries/web/web_application_should_only_be_accessible_over_https.sql")
      }
    }

    policy "0814_01n1organizational_12_01_n" {
      title = "The ability of users to connect to the internal network is restricted using a deny-by-default and allow-by-exception policy at managed interfaces according to the access control policy and the requirements of clinical and business applications."

      check "1" {
        title = "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
        doc   = file("hipaa_hitrust_v9.2/docs/0814_01n1organizational_12_01_n_1.md")
        query = file("queries/manual.sql")
      }

      check "2" {
        title = "API App should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0814_01n1organizational_12_01_n_2.md")
        query = file("queries/web/api_app_should_only_be_accessible_over_https.sql")
      }

      check "3" {
        title = "Enforce SSL connection should be enabled for MySQL database servers"
        doc   = file("hipaa_hitrust_v9.2/docs/0814_01n1organizational_12_01_n_3.md")
        query = file("queries/mysql/enforce_ssl_connection_should_be_enabled_for_mysql_database_servers.sql")
      }

      check "4" {
        title = "Enforce SSL connection should be enabled for PostgreSQL database servers"
        doc   = file("hipaa_hitrust_v9.2/docs/0814_01n1organizational_12_01_n_4.md")
        query = file("queries/postgresql/enforce_ssl_connection_should_be_enabled_for_postgresql_database_servers.sql")
      }

      check "5" {
        title = "Function App should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0814_01n1organizational_12_01_n_5.md")
        query = file("queries/web/function_app_should_only_be_accessible_over_https.sql")
      }

      check "6" {
        title = "Internet-facing virtual machines should be protected with network security groups"
        doc   = file("hipaa_hitrust_v9.2/docs/0814_01n1organizational_12_01_n_6.md")
        query = file("queries/compute/internet-facing_virtual_machines_should_be_protected_with_network_security_groups.sql")
      }

      check "7" {
        title = "Latest TLS version should be used in your API App"
        doc   = file("hipaa_hitrust_v9.2/docs/0814_01n1organizational_12_01_n_7.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_api_app.sql")
      }

      check "8" {
        title = "Latest TLS version should be used in your Function App"
        doc   = file("hipaa_hitrust_v9.2/docs/0814_01n1organizational_12_01_n_8.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_function_app.sql")
      }

      check "9" {
        title = "Latest TLS version should be used in your Web App"
        doc   = file("hipaa_hitrust_v9.2/docs/0814_01n1organizational_12_01_n_9.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_web_app.sql")
      }

      check "10" {
        title = "Only secure connections to your Azure Cache for Redis should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/0814_01n1organizational_12_01_n_10.md")
        query = file("queries/redis/only_secure_connections_to_your_azure_cache_for_redis_should_be_enabled.sql")
      }

      check "11" {
        title = "Secure transfer to storage accounts should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/0814_01n1organizational_12_01_n_11.md")
        query = file("queries/storage/secure_transfer_to_storage_accounts_should_be_enabled.sql")
      }

      check "12" {
        title = "Subnets should be associated with a Network Security Group"
        doc   = file("hipaa_hitrust_v9.2/docs/0814_01n1organizational_12_01_n_12.md")
        query = file("queries/network/subnets_without_nsg_associated.sql")
      }

      check "13" {
        title = "Virtual machines should be connected to an approved virtual network"
        doc   = file("hipaa_hitrust_v9.2/docs/0814_01n1organizational_12_01_n_13.md")
        query = file("queries/compute/vms_without_approved_networks.sql")
      }

      check "14" {
        title = "Web Application should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0814_01n1organizational_12_01_n_14.md")
        query = file("queries/web/web_application_should_only_be_accessible_over_https.sql")
      }
    }
  }

  policy "user_identification_and_authentication" {
    title = "User Identification and Authentication"

    policy "11109_01q1organizational_57_01_q" {
      title = "The organization ensures that redundant user IDs are not issued to other users and that all users are uniquely identified and authenticated for both local and remote access to information systems."

      check "1" {
        title = "MFA should be enabled on accounts with owner permissions on your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/11109_01q1organizational_57_01_q_1.md")
        query = file("queries/security/mfa_should_be_enabled_on_accounts_with_owner_permissions_on_your_subscription.sql")
      }
    }

    policy "11110_01q1organizational_6_01_q" {
      title = "Non-organizational users (all information system users other than organizational users, such as patients, customers, contractors, or foreign nationals), or processes acting on behalf of non-organizational users, determined to need access to information residing on the organization's information systems, are uniquely identified and authenticated."

      check "1" {
        title = "MFA should be enabled accounts with write permissions on your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/11110_01q1organizational_6_01_q_1.md")
        query = file("queries/security/mfa_should_be_enabled_accounts_with_write_permissions_on_your_subscription.sql")
      }
    }

    policy "11111_01q2system_4_01_q" {
      title = "When PKI-based authentication is used, the information system validates certificates by constructing and verifying a certification path to an accepted trust anchor, including checking certificate status information; enforces access to the corresponding private key; maps the identity to the corresponding account of the individual or group; and implements a local cache of revocation data to support path discovery and validation in case of an inability to access revocation information via the network."

      check "1" {
        title = "MFA should be enabled on accounts with read permissions on your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/11111_01q2system_4_01_q_1.md")
        query = file("queries/security/mfa_should_be_enabled_on_accounts_with_read_permissions_on_your_subscription.sql")
      }
    }

    policy "11112_01q2organizational_67_01_q" {
      title = "The information system employs replay-resistant authentication mechanisms such as nonce, one-time passwords, or time stamps to secure network access for privileged accounts; and, for hardware token-based authentication, employs mechanisms that satisfy minimum token requirements discussed in NIST SP 800-63-2, Electronic Authentication Guideline."

      check "1" {
        title = "A maximum of 3 owners should be designated for your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/11112_01q2organizational_67_01_q_1.md")
        query = file("queries/authorization/subscriptions_with_more_than_3_owners.sql")
      }
    }

    policy "11208_01q1organizational_8_01_q" {
      title = "The organization requires that electronic signatures, unique to one individual, cannot be reused by, or reassigned to, anyone else."

      check "1" {
        title = "There should be more than one owner assigned to your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/11208_01q1organizational_8_01_q_1.md")
        query = file("queries/authorization/subscriptions_with_less_than_2_owners.sql")
      }
    }

    policy "11210_01q2organizational_10_01_q" {
      title = "Electronic signatures and handwritten signatures executed to electronic records shall be linked to their respective electronic records."

      check "1" {
        title = "Audit Windows machines that have the specified members in the Administrators group"
        doc   = file("hipaa_hitrust_v9.2/docs/11210_01q2organizational_10_01_q_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "11211_01q2organizational_11_01_q" {
      title = "Signed electronic records shall contain information associated with the signing in human-readable format."

      check "1" {
        title = "Audit Windows machines missing any of specified members in the Administrators group"
        doc   = file("hipaa_hitrust_v9.2/docs/11211_01q2organizational_11_01_q_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "1123_01q1system_2_01_q" {
      title = "Users who performed privileged functions (e.g., system administration) use separate accounts when performing those privileged functions."

      check "1" {
        title = "Audit Windows machines that have extra accounts in the Administrators group"
        doc   = file("hipaa_hitrust_v9.2/docs/1123_01q1system_2_01_q_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "1125_01q2system_1_01_q" {
      title = "Multi-factor authentication methods are used in accordance with organizational policy, (e.g., for remote network access)."

      check "1" {
        title = "Audit Windows machines that have the specified members in the Administrators group"
        doc   = file("hipaa_hitrust_v9.2/docs/1125_01q2system_1_01_q_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "1127_01q2system_3_01_q" {
      title = "Where tokens are provided for multi-factor authentication, in-person verification is required prior to granting access."

      check "1" {
        title = "Audit Windows machines missing any of specified members in the Administrators group"
        doc   = file("hipaa_hitrust_v9.2/docs/1127_01q2system_3_01_q_1.md")
        query = file("queries/manual.sql")
      }
    }
  }

  policy "identification_of_risks_related_to_external_parties" {
    title = "Identification of Risks Related to External Parties"

    policy "1401_05i1organizational_1239_05_i" {
      title = "Access to the organizations information and systems by external parties is not permitted until due diligence has been conducted, the appropriate controls have been implemented, and a contract/agreement reflecting the security requirements is signed acknowledging they understand and accept their obligations."

      check "1" {
        title = "Secure transfer to storage accounts should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1401_05i1organizational_1239_05_i_1.md")
        query = file("queries/storage/secure_transfer_to_storage_accounts_should_be_enabled.sql")
      }
    }

    policy "1402_05i1organizational_45_05_i" {
      title = "Remote access connections between the organization and external parties are encrypted."

      check "1" {
        title = "Function App should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/1402_05i1organizational_45_05_i_1.md")
        query = file("queries/web/function_app_should_only_be_accessible_over_https.sql")
      }
    }

    policy "1403_05i1organizational_67_05_i" {
      title = "Access granted to external parties is limited to the minimum necessary and granted only for the duration required."

      check "1" {
        title = "Web Application should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/1403_05i1organizational_67_05_i_1.md")
        query = file("queries/web/web_application_should_only_be_accessible_over_https.sql")
      }
    }

    policy "1404_05i2organizational_1_05_i" {
      title = "Due diligence of the external party includes interviews, document review, checklists, certification reviews (e.g. HITRUST) or other remote means."

      check "1" {
        title = "API App should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/1404_05i2organizational_1_05_i_1.md")
        query = file("queries/web/api_app_should_only_be_accessible_over_https.sql")
      }
    }

    policy "1418_05i1organizational_8_05_i" {
      title = "The identification of risks related to external party access takes into account a minimal set of specifically defined issues."

      check "1" {
        title = "Enforce SSL connection should be enabled for MySQL database servers"
        doc   = file("hipaa_hitrust_v9.2/docs/1418_05i1organizational_8_05_i_1.md")
        query = file("queries/mysql/enforce_ssl_connection_should_be_enabled_for_mysql_database_servers.sql")
      }
    }

    policy "1450_05i2organizational_2_05_i" {
      title = "The organization obtains satisfactory assurances that reasonable information security exists across their information supply chain by performing an annual review, which includes all partners/third party-providers upon which their information supply chain depends."

      check "1" {
        title = "Enforce SSL connection should be enabled for PostgreSQL database servers"
        doc   = file("hipaa_hitrust_v9.2/docs/1450_05i2organizational_2_05_i_1.md")
        query = file("queries/postgresql/enforce_ssl_connection_should_be_enabled_for_postgresql_database_servers.sql")
      }
    }

    policy "1451_05icsporganizational_2_05_i" {
      title = "Cloud service providers design and implement controls to mitigate and contain data security risks through proper separation of duties, role-based access, and least-privilege access for all personnel within their supply chain."

      check "1" {
        title = "Only secure connections to your Azure Cache for Redis should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1451_05icsporganizational_2_05_i_1.md")
        query = file("queries/redis/only_secure_connections_to_your_azure_cache_for_redis_should_be_enabled.sql")
      }
    }
  }

  policy "audit_logging" {
    title = "Audit Logging"

    policy "1202_09aa1system_1_09_aa" {
      title = "A secure audit record is created for all activities on the system (create, read, update, delete) involving covered information."

      check "1" {
        title = "Resource logs in Azure Data Lake Store should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1202_09aa1system_1_09_aa_1.md")
        query = file("queries/datalake/datalake_storage_accounts_with_disabled_logging.sql")
      }

      check "2" {
        title = "System updates on virtual machine scale sets should be installed"
        doc   = file("hipaa_hitrust_v9.2/docs/1202_09aa1system_1_09_aa_2.md")
        query = file("queries/manual.sql")
      }
    }

    policy "1203_09aa1system_2_09_aa" {
      title = "Audit records include the unique user ID, unique data subject ID, function performed, and date/time the event was performed."

      check "1" {
        title = "Resource logs in Logic Apps should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1203_09aa1system_2_09_aa_1.md")
        query = file("queries/logic/app_workflow_logging_enabled.sql")
      }
    }

    policy "1204_09aa1system_3_09_aa" {
      title = "The activities of privileged users (administrators, operators, etc.) include the success/failure of the event, time the event occurred, the account involved, the processes involved, and additional information about the event."

      check "1" {
        title = "Resource logs in IoT Hub should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1204_09aa1system_3_09_aa_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "1205_09aa2system_1_09_aa" {
      title = "Logs of messages sent and received are maintained including the date, time, origin and destination of the message, but not its contents."

      check "1" {
        title = "Resource logs in Batch accounts should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1205_09aa2system_1_09_aa_1.md")
        query = file("queries/batch/resource_logs_in_batch_accounts_should_be_enabled.sql")
      }
    }

    policy "1206_09aa2system_23_09_aa" {
      title = "Auditing is always available while the system is active and tracks key events, success/failed data access, system security configuration changes, privileged or utility use, any alarms raised,  activation and de-activation of protection systems (e.g., A/V and IDS), activation and deactivation of identification and authentication mechanisms, and creation and deletion of system-level objects."

      check "1" {
        title = "Resource logs in Virtual Machine Scale Sets should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1206_09aa2system_23_09_aa_1.md")
        query = file("queries/compute/virtual_machine_scale_sets_without_logs.sql")
      }
    }

    policy "1207_09aa2system_4_09_aa" {
      title = "Audit records are retained for 90 days and older audit records are archived for one year."

      check "1" {
        title = "Resource logs in Azure Stream Analytics should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1207_09aa2system_4_09_aa_1.md")
        query = file("queries/streamanalytics/resource_logs_in_azure_stream_analytics_should_be_enabled.sql")
      }

      check "2" {
        title = "Resource logs in Event Hub should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1207_09aa2system_4_09_aa_2.md")
        query = file("queries/eventhub/namespaces_without_logging.sql")
      }
    }

    policy "1208_09aa3system_1_09_aa" {
      title = "Audit logs are maintained for management activities, system and application startup/shutdown/errors, file changes, and security policy changes."

      check "1" {
        title = "Resource logs in Search services should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1208_09aa3system_1_09_aa_1.md")
        query = file("queries/search/resource_logs_in_search_services_should_be_enabled.sql")
      }

      check "2" {
        title = "Resource logs in Service Bus should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1208_09aa3system_1_09_aa_2.md")
        query = file("queries/servicebus/resource_logs_in_service_bus_should_be_enabled.sql")
      }
    }

    policy "1209_09aa3system_2_09_aa" {
      title = "The information system generates audit records containing the following detailed information: (i) filename accessed; (ii) program or command used to initiate the event; and (iii) source and destination addresses."

      check "1" {
        title = "Resource logs in App Services should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1209_09aa3system_2_09_aa_1.md")
        query = file("queries/web/apps_with_logging_disabled.sql")
      }
    }

    policy "1210_09aa3system_3_09_aa" {
      title = "All disclosures of covered information within or outside of the organization are logged including type of disclosure, date/time of the event, recipient, and sender."

      check "1" {
        title = "Audit diagnostic setting"
        doc   = file("hipaa_hitrust_v9.2/docs/1210_09aa3system_3_09_aa_1.md")
        query = file("queries/manual.sql")
      }

      check "2" {
        title = "Resource logs in Data Lake Analytics should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1210_09aa3system_3_09_aa_2.md")
        query = file("queries/manual.sql")
      }
    }

    policy "1211_09aa3system_4_09_aa" {
      title = "The organization verifies every ninety (90) days for each extract of covered information recorded that the data is erased or its use is still required."

      check "1" {
        title = "Auditing on SQL server should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1211_09aa3system_4_09_aa_1.md")
        query = file("queries/sql/sqlserverauditing_audit.sql")
      }

      check "2" {
        title = "Resource logs in Azure Key Vault Managed HSM should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1211_09aa3system_4_09_aa_2.md")
        query = file("queries/keyvault/hsms_without_logging.sql")
      }

      check "3" {
        title = "Resource logs in Key Vault should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1211_09aa3system_4_09_aa_3.md")
        query = file("queries/keyvault/vaults_without_logging.sql")
      }
    }
  }

  policy "monitoring_system_use" {
    title = "Monitoring System Use"

    policy "1120_09ab3system_9_09_ab" {
      title = "Unauthorized remote connections to the information systems are monitored and reviewed at least quarterly, and appropriate action is taken if an unauthorized connection is discovered."

      check "1" {
        title = "Azure Monitor should collect activity logs from all regions"
        doc   = file("hipaa_hitrust_v9.2/docs/1120_09ab3system_9_09_ab_1.md")
        query = file("queries/monitor/azure_monitor_should_collect_activity_logs_from_all_regions.sql")
      }
    }

    policy "12100_09ab2system_15_09_ab" {
      title = "The organization monitors the information system to identify irregularities or anomalies that are indicators of a system malfunction or compromise and help confirm the system is functioning in an optimal, resilient and secure state."

      check "1" {
        title = "Virtual machines should have the Log Analytics extension installed"
        doc   = file("hipaa_hitrust_v9.2/docs/12100_09ab2system_15_09_ab_1.md")
        query = file("queries/compute/machines_without_log_analytics_agent.sql")
      }
    }

    policy "12101_09ab1organizational_3_09_ab" {
      title = "The organization specifies how often audit logs are reviewed, how the reviews are documented, and the specific roles and responsibilities of the personnel conducting the reviews, including the professional certifications or other qualifications required."

      check "1" {
        title = "The Log Analytics extension should be installed on Virtual Machine Scale Sets"
        doc   = file("hipaa_hitrust_v9.2/docs/12101_09ab1organizational_3_09_ab_1.md")
        query = file("queries/compute/scale_sets_without_log_analytics_agent.sql")
      }
    }

    policy "12102_09ab1organizational_4_09_ab" {
      title = "The organization shall periodically test its monitoring and detection processes, remediate deficiencies, and improve its processes."

      check "1" {
        title = "Audit Windows machines on which the Log Analytics agent is not connected as expected"
        doc   = file("hipaa_hitrust_v9.2/docs/12102_09ab1organizational_4_09_ab_1.md")
        query = file("queries/compute/guestconfiguration_windowsloganalyticsagentconnection_aine.sql")
      }
    }

    policy "1212_09ab1system_1_09_ab" {
      title = "All applicable legal requirements related to monitoring authorized access and unauthorized access attempts are met."

      check "1" {
        title = "Azure Monitor log profile should collect logs for categories 'write,' 'delete,' and 'action'"
        doc   = file("hipaa_hitrust_v9.2/docs/1212_09ab1system_1_09_ab_1.md")
        query = file("queries/monitor/azure_monitor_log_profile_should_collect_logs_for_categories_write_delete_and_action.sql")
      }
    }

    policy "1213_09ab2system_128_09_ab" {
      title = "Automated systems deployed throughout the organization's environment are used to monitor key events and anomalous activity, and analyze system logs, the results of which are reviewed regularly."

      check "1" {
        title = "Auto provisioning of the Log Analytics agent should be enabled on your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1213_09ab2system_128_09_ab_1.md")
        query = file("queries/security/asc_automatic_provisioning_log_analytics_monitoring_agent.sql")
      }
    }

    policy "1214_09ab2system_3456_09_ab" {
      title = "Monitoring includes privileged operations, authorized access or unauthorized access attempts, including attempts to access deactivated accounts, and system alerts or failures."

      check "1" {
        title = "Azure Monitor should collect activity logs from all regions"
        doc   = file("hipaa_hitrust_v9.2/docs/1214_09ab2system_3456_09_ab_1.md")
        query = file("queries/monitor/azure_monitor_should_collect_activity_logs_from_all_regions.sql")
      }
    }

    policy "1215_09ab2system_7_09_ab" {
      title = "Auditing and monitoring systems employed by the organization support audit reduction and report generation."

      check "1" {
        title = "Virtual machines should have the Log Analytics extension installed"
        doc   = file("hipaa_hitrust_v9.2/docs/1215_09ab2system_7_09_ab_1.md")
        query = file("queries/compute/machines_without_log_analytics_agent.sql")
      }
    }

    policy "1216_09ab3system_12_09_ab" {
      title = "Automated systems are used to review monitoring activities of security systems (e.g., IPS/IDS) and system records on a daily basis, and identify and document anomalies."

      check "1" {
        title = "The Log Analytics extension should be installed on Virtual Machine Scale Sets"
        doc   = file("hipaa_hitrust_v9.2/docs/1216_09ab3system_12_09_ab_1.md")
        query = file("queries/compute/scale_sets_without_log_analytics_agent.sql")
      }
    }

    policy "1217_09ab3system_3_09_ab" {
      title = "Alerts are generated for technical personnel to analyze and investigate suspicious activity or suspected violations."

      check "1" {
        title = "Audit Windows machines on which the Log Analytics agent is not connected as expected"
        doc   = file("hipaa_hitrust_v9.2/docs/1217_09ab3system_3_09_ab_1.md")
        query = file("queries/compute/guestconfiguration_windowsloganalyticsagentconnection_aine.sql")
      }
    }

    policy "1219_09ab3system_10_09_ab" {
      title = "The information system is able to automatically process audit records for events of interest based on selectable criteria."

      check "1" {
        title = "Azure Monitor log profile should collect logs for categories 'write,' 'delete,' and 'action'"
        doc   = file("hipaa_hitrust_v9.2/docs/1219_09ab3system_10_09_ab_1.md")
        query = file("queries/monitor/azure_monitor_log_profile_should_collect_logs_for_categories_write_delete_and_action.sql")
      }
    }

    policy "1220_09ab3system_56_09_ab" {
      title = "Monitoring includes inbound and outbound communications and file integrity monitoring."

      check "1" {
        title = "Auto provisioning of the Log Analytics agent should be enabled on your subscription"
        doc   = file("hipaa_hitrust_v9.2/docs/1220_09ab3system_56_09_ab_1.md")
        query = file("queries/security/asc_automatic_provisioning_log_analytics_monitoring_agent.sql")
      }
    }
  }

  policy "administrator_and_operator_logs" {
    title = "Administrator and Operator Logs"

    policy "1270_09ad1system_12_09_ad" {
      title = "The organization ensures proper logging is enabled in order to audit administrator activities; and reviews system administrator and operator logs on a regular basis."

      check "activitylog_administrativeoperations_audit" {
        title = "An activity log alert should exist for specific Administrative operations"
        doc   = file("hipaa_hitrust_v9.2/docs/1270_09ad1system_12_09_ad_activitylog_administrativeoperations_audit.md")
        query = file("queries/monitor/activitylog_administrativeoperations_audit.sql")
      }
    }

    policy "1271_09ad1system_1_09_ad" {
      title = "An intrusion detection system managed outside of the control of system and network administrators is used to monitor system and network administration activities for compliance."

      check "activitylog_administrativeoperations_audit" {
        title = "An activity log alert should exist for specific Administrative operations"
        doc   = file("hipaa_hitrust_v9.2/docs/1271_09ad1system_1_09_ad_activitylog_administrativeoperations_audit.md")
        query = file("queries/monitor/activitylog_administrativeoperations_audit.sql")
      }
    }
  }

  policy "segregation_of_duties" {
    title = "Segregation of Duties"

    policy "1229_09c1organizational_1_09_c" {
      title = "Separation of duties is used to limit the risk of unauthorized or unintentional modification of information and systems."

      check "1" {
        title = "Role-Based Access Control (RBAC) should be used on Kubernetes Services"
        doc   = file("hipaa_hitrust_v9.2/docs/1229_09c1organizational_1_09_c_1.md")
        query = file("queries/container/aks_rbac_disabled.sql")
      }
    }

    policy "1230_09c2organizational_1_09_c" {
      title = "No single person is able to access, modify, or use information systems without authorization or detection."

      check "1" {
        title = "Audit usage of custom RBAC rules"
        doc   = file("hipaa_hitrust_v9.2/docs/1230_09c2organizational_1_09_c_1.md")
        query = file("queries/authorization/custom_roles.sql")
      }
    }

    policy "1232_09c3organizational_12_09_c" {
      title = "Access for individuals responsible for administering  access controls is limited to the minimum necessary based upon each user's role and responsibilities and these individuals cannot access audit functions related to these controls."

      check "1" {
        title = "Windows machines should meet requirements for 'User Rights Assignment'"
        doc   = file("hipaa_hitrust_v9.2/docs/1232_09c3organizational_12_09_c_1.md")
        query = file("queries/network/rdp_access_permitted.sql")
      }
    }

    policy "1277_09c2organizational_4_09_c" {
      title = "The initiation of an event is separated from its authorization to reduce the possibility of collusion."

      check "1" {
        title = "Windows machines should meet requirements for 'Security Options_User Account Control'"
        doc   = file("hipaa_hitrust_v9.2/docs/1277_09c2organizational_4_09_c_1.md")
        query = file("queries/manual.sql")
      }
    }
  }

  policy "controls_against_malicious_code" {
    title = "Controls Against Malicious Code"

    policy "0201_09j1organizational_124_09_j" {
      title = "Anti-virus and anti-spyware are installed, operating and updated on all end-user devices to conduct periodic scans of the systems to identify and remove unauthorized software. Server environments for which the server software developer specifically recommends not installing host-based anti-virus and anti-spyware software may address the requirement via a network-based malware detection (NBMD) solution."

      check "1" {
        title = "Adaptive application controls for defining safe applications should be enabled on your machines"
        doc   = file("hipaa_hitrust_v9.2/docs/0201_09j1organizational_124_09_j_1.md")
        query = file("queries/manual.sql")
      }

      check "2" {
        title = "Deploy default Microsoft IaaSAntimalware extension for Windows Server"
        doc   = file("hipaa_hitrust_v9.2/docs/0201_09j1organizational_124_09_j_2.md")
        query = file("queries/compute/vmantimalwareextension_deploy.sql")
      }

      check "3" {
        title = "Endpoint protection solution should be installed on virtual machine scale sets"
        doc   = file("hipaa_hitrust_v9.2/docs/0201_09j1organizational_124_09_j_3.md")
        query = file("queries/compute/endpoint_protection_solution_should_be_installed_on_virtual_machine_scale_sets.sql")
      }

      check "4" {
        title = "Microsoft Antimalware for Azure should be configured to automatically update protection signatures"
        doc   = file("hipaa_hitrust_v9.2/docs/0201_09j1organizational_124_09_j_4.md")
        query = file("queries/compute/virtualmachines_antimalwareautoupdate_auditifnotexists.sql")
      }

      check "5" {
        title = "Monitor missing Endpoint Protection in Azure Security Center"
        doc   = file("hipaa_hitrust_v9.2/docs/0201_09j1organizational_124_09_j_5.md")
        query = file("queries/manual.sql")
      }

      check "6" {
        title = "System updates should be installed on your machines"
        doc   = file("hipaa_hitrust_v9.2/docs/0201_09j1organizational_124_09_j_6.md")
        query = file("queries/compute/asc_missingsystemupdates_audit.sql")
      }
    }
  }

  policy "back_up" {
    title = "Back-up"

    policy "1616_09l1organizational_16_09_l" {
      title = "Backup copies of information and software are made and tests of the media and restoration procedures are regularly performed at appropriate intervals."

      check "1" {
        title = "Long-term geo-redundant backup should be enabled for Azure SQL Databases"
        doc   = file("hipaa_hitrust_v9.2/docs/1616_09l1organizational_16_09_l_1.md")
        query = file("queries/sql/long-term_geo-redundant_backup_should_be_enabled_for_azure_sql_databases.sql")
      }
    }

    policy "1617_09l1organizational_23_09_l" {
      title = "A formal definition of the level of backup required for each system is defined and documented including how each system will be restored, the scope of data to be imaged, frequency of imaging, and duration of retention based on relevant contractual, legal, regulatory and business requirements."

      check "1" {
        title = "Geo-redundant backup should be enabled for Azure Database for MySQL"
        doc   = file("hipaa_hitrust_v9.2/docs/1617_09l1organizational_23_09_l_1.md")
        query = file("queries/sql/mysql_servers_without_geo_redundant_backups.sql")
      }
    }

    policy "1618_09l1organizational_45_09_l" {
      title = "The backups are stored in a physically secure remote location, at a sufficient distance to make them reasonably immune from damage to data at the primary site, and reasonable physical and environmental controls are in place to ensure their protection at the remote location."

      check "1" {
        title = "Geo-redundant backup should be enabled for Azure Database for PostgreSQL"
        doc   = file("hipaa_hitrust_v9.2/docs/1618_09l1organizational_45_09_l_1.md")
        query = file("queries/sql/postgresql_servers_without_geo_redundant_backups.sql")
      }
    }

    policy "1619_09l1organizational_7_09_l" {
      title = "Inventory records for the backup copies, including content and current location, are maintained."

      check "1" {
        title = "Geo-redundant backup should be enabled for Azure Database for MariaDB"
        doc   = file("hipaa_hitrust_v9.2/docs/1619_09l1organizational_7_09_l_1.md")
        query = file("queries/sql/mariadb_servers_without_geo_redundant_backups.sql")
      }
    }

    policy "1620_09l1organizational_8_09_l" {
      title = "When the backup service is delivered by the third party, the service level agreement includes the detailed protections to control confidentiality, integrity and availability of the backup information."

      check "1" {
        title = "Azure Backup should be enabled for Virtual Machines"
        doc   = file("hipaa_hitrust_v9.2/docs/1620_09l1organizational_8_09_l_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "1621_09l2organizational_1_09_l" {
      title = "Automated tools are used to track all backups."

      check "1" {
        title = "Long-term geo-redundant backup should be enabled for Azure SQL Databases"
        doc   = file("hipaa_hitrust_v9.2/docs/1621_09l2organizational_1_09_l_1.md")
        query = file("queries/sql/long-term_geo-redundant_backup_should_be_enabled_for_azure_sql_databases.sql")
      }
    }

    policy "1622_09l2organizational_23_09_l" {
      title = "The integrity and security of the backup copies are maintained to ensure future availability, and any potential accessibility problems with the backup copies are identified and mitigated in the event of an area-wide disaster."

      check "1" {
        title = "Geo-redundant backup should be enabled for Azure Database for MySQL"
        doc   = file("hipaa_hitrust_v9.2/docs/1622_09l2organizational_23_09_l_1.md")
        query = file("queries/sql/mysql_servers_without_geo_redundant_backups.sql")
      }
    }

    policy "1623_09l2organizational_4_09_l" {
      title = "Covered information is backed-up in an encrypted format to ensure confidentiality."

      check "1" {
        title = "Geo-redundant backup should be enabled for Azure Database for PostgreSQL"
        doc   = file("hipaa_hitrust_v9.2/docs/1623_09l2organizational_4_09_l_1.md")
        query = file("queries/sql/postgresql_servers_without_geo_redundant_backups.sql")
      }
    }

    policy "1624_09l3organizational_12_09_l" {
      title = "The organization performs incremental or differential backups daily and full backups weekly to separate media."

      check "1" {
        title = "Geo-redundant backup should be enabled for Azure Database for MariaDB"
        doc   = file("hipaa_hitrust_v9.2/docs/1624_09l3organizational_12_09_l_1.md")
        query = file("queries/sql/mariadb_servers_without_geo_redundant_backups.sql")
      }
    }

    policy "1625_09l3organizational_34_09_l" {
      title = "Three (3) generations of backups (full plus all related incremental or differential backups) are stored off-site, and both on-site and off-site backups are logged with name, date, time and action."

      check "1" {
        title = "Azure Backup should be enabled for Virtual Machines"
        doc   = file("hipaa_hitrust_v9.2/docs/1625_09l3organizational_34_09_l_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "1626_09l3organizational_5_09_l" {
      title = "The organization ensures a current, retrievable copy of covered information is available before movement of servers."

      check "1" {
        title = "Geo-redundant backup should be enabled for Azure Database for PostgreSQL"
        doc   = file("hipaa_hitrust_v9.2/docs/1626_09l3organizational_5_09_l_1.md")
        query = file("queries/sql/postgresql_servers_without_geo_redundant_backups.sql")
      }
    }

    policy "1627_09l3organizational_6_09_l" {
      title = "The organization tests backup information following each backup to verify media reliability and information integrity, and at least annually thereafter."

      check "1" {
        title = "Geo-redundant backup should be enabled for Azure Database for MariaDB"
        doc   = file("hipaa_hitrust_v9.2/docs/1627_09l3organizational_6_09_l_1.md")
        query = file("queries/sql/mariadb_servers_without_geo_redundant_backups.sql")
      }
    }

    policy "1699_09l1organizational_10_09_l" {
      title = "Workforce members roles and responsibilities in the data backup process are identified and communicated to the workforce; in particular, Bring Your Own Device (BYOD) users are required to perform backups of organizational and/or client data on their devices."

      check "1" {
        title = "Azure Backup should be enabled for Virtual Machines"
        doc   = file("hipaa_hitrust_v9.2/docs/1699_09l1organizational_10_09_l_1.md")
        query = file("queries/manual.sql")
      }
    }
  }

  policy "network_controls" {
    title = "Network Controls"

    policy "0858_09m1organizational_4_09_m" {
      title = "The organization monitors for all authorized and unauthorized wireless access to the information system and prohibits installation of wireless access points (WAPs) unless explicitly authorized in writing by the CIO or his/her designated representative."

      check "1" {
        title = "All network ports should be restricted on network security groups associated to your virtual machine"
        doc   = file("hipaa_hitrust_v9.2/docs/0858_09m1organizational_4_09_m_1.md")
        query = file("queries/network/asc_unprotectedendpoints_audit.sql")
      }

      check "2" {
        title = "Management ports of virtual machines should be protected with just-in-time network access control"
        doc   = file("hipaa_hitrust_v9.2/docs/0858_09m1organizational_4_09_m_2.md")
        query = file("queries/compute/virtual_machines_without_jit_network_access_policy.sql")
      }

      check "3" {
        title = "Windows machines should meet requirements for 'Windows Firewall Properties'"
        doc   = file("hipaa_hitrust_v9.2/docs/0858_09m1organizational_4_09_m_3.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0859_09m1organizational_78_09_m" {
      title = "The organization ensures the security of information in networks, availability of network services and information services using the network, and the protection of connected services from unauthorized access."

      check "1" {
        title = "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
        doc   = file("hipaa_hitrust_v9.2/docs/0859_09m1organizational_78_09_m_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0860_09m1organizational_9_09_m" {
      title = "The organization formally manages equipment on the network, including equipment in user areas."

      check "1" {
        title = "Deploy Diagnostic Settings for Network Security Groups"
        doc   = file("hipaa_hitrust_v9.2/docs/0860_09m1organizational_9_09_m_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0861_09m2organizational_67_09_m" {
      title = "To identify and authenticate devices on local and/or wide area networks, including wireless networks,  the information system uses either a (i) shared known information solution or (ii) an organizational authentication solution, the exact selection and strength of which is dependent on the security categorization of the information system."

      check "1" {
        title = "App Service should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0861_09m2organizational_67_09_m_1.md")
        query = file("queries/network/virtualnetworkserviceendpoint_appservice_auditifnotexists.sql")
      }

      check "2" {
        title = "Windows machines should meet requirements for 'Security Options_Network Access'"
        doc   = file("hipaa_hitrust_v9.2/docs/0861_09m2organizational_67_09_m_2.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0862_09m2organizational_8_09_m" {
      title = "The organization ensures information systems protect the confidentiality and integrity of transmitted information, including during preparation for transmission and during reception."

      check "1" {
        title = "SQL Server should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0862_09m2organizational_8_09_m_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0863_09m2organizational_910_09_m" {
      title = "The organization builds a firewall configuration that restricts connections between un-trusted networks and any system components in the covered information environment; and any changes to the firewall configuration are updated in the network diagram."

      check "1" {
        title = "Event Hub should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0863_09m2organizational_910_09_m_1.md")
        query = file("queries/eventhub/event_hub_should_use_a_virtual_network_service_endpoint.sql")
      }
    }

    policy "0864_09m2organizational_12_09_m" {
      title = "Usage restrictions and implementation guidance are formally defined for VoIP, including the authorization and monitoring of the service."

      check "1" {
        title = "Cosmos DB should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0864_09m2organizational_12_09_m_1.md")
        query = file("queries/cosmosdb/cosmos_db_should_use_a_virtual_network_service_endpoint.sql")
      }
    }

    policy "0865_09m2organizational_13_09_m" {
      title = "The organization (i) authorizes connections from the information system to other information systems outside of the organization through the use of interconnection security agreements or other formal agreement; (ii) documents each connection, the interface characteristics, security requirements, and the nature of the information communicated; (iii) employs a deny all, permit by exception policy for allowing connections from the information system to other information systems outside of the organization; and (iv) applies a default-deny rule that drops all traffic via host-based firewalls or port filtering tools on its endpoints (workstations, servers, etc.), except those services and ports that are explicitly allowed."

      check "1" {
        title = "Key Vault should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0865_09m2organizational_13_09_m_1.md")
        query = file("queries/keyvault/vaults_with_no_service_endpoint.sql")
      }
    }

    policy "0866_09m3organizational_1516_09_m" {
      title = "The organization describes the groups, roles, and responsibilities for the logical management of network components and ensures coordination of and consistency in the elements of the network infrastructure."

      check "1" {
        title = "Storage accounts should restrict network access"
        doc   = file("hipaa_hitrust_v9.2/docs/0866_09m3organizational_1516_09_m_1.md")
        query = file("queries/storage/accounts_with_not_restricted_asscess.sql")
      }
    }

    policy "0867_09m3organizational_17_09_m" {
      title = "Wireless access points are placed in secure areas and shut down when not in use (e.g. nights, weekends)."

      check "1" {
        title = "Storage Accounts should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0867_09m3organizational_17_09_m_1.md")
        query = file("queries/storage/accounts_with_no_service_endpoint_associated.sql")
      }
    }

    policy "0868_09m3organizational_18_09_m" {
      title = "The organization builds a firewall configuration to restrict inbound and outbound traffic to that which is necessary for the covered data environment."

      check "1" {
        title = "[Preview]: Container Registry should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0868_09m3organizational_18_09_m_1.md")
        query = file("queries/container/containers_without_virtual_service_endpoint.sql")
      }
    }

    policy "0869_09m3organizational_19_09_m" {
      title = "The router configuration files are secured and synchronized."

      check "1" {
        title = "[Preview]: Container Registry should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0869_09m3organizational_19_09_m_1.md")
        query = file("queries/container/containers_without_virtual_service_endpoint.sql")
      }
    }

    policy "0870_09m3organizational_20_09_m" {
      title = "Access to all proxies is denied, except for those hosts, ports, and services that are explicitly required."

      check "1" {
        title = "[Preview]: Container Registry should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0870_09m3organizational_20_09_m_1.md")
        query = file("queries/container/containers_without_virtual_service_endpoint.sql")
      }
    }

    policy "0871_09m3organizational_22_09_m" {
      title = "Authoritative DNS servers are segregated into internal and external roles."

      check "1" {
        title = "[Preview]: Container Registry should use a virtual network service endpoint"
        doc   = file("hipaa_hitrust_v9.2/docs/0871_09m3organizational_22_09_m_1.md")
        query = file("queries/container/containers_without_virtual_service_endpoint.sql")
      }
    }
  }

  policy "security_of_network_services" {
    title = "Security of Network Services"

    policy "0835_09n1organizational_1_09_n" {
      title = "Agreed services provided by a network service provider/manager are formally managed and monitored to ensure they are provided securely."

      check "1" {
        title = "[Preview]: Network traffic data collection agent should be installed on Windows virtual machines"
        doc   = file("hipaa_hitrust_v9.2/docs/0835_09n1organizational_1_09_n_1.md")
        query = file("queries/compute/windows_machines_without_data_collection_agent.sql")
      }

      check "2" {
        title = "Virtual machines should be migrated to new Azure Resource Manager resources"
        doc   = file("hipaa_hitrust_v9.2/docs/0835_09n1organizational_1_09_n_2.md")
        query = file("queries/compute/vms_no_resource_manager.sql")
      }
    }

    policy "0836_09_n2organizational_1_09_n" {
      title = "The organization formally authorizes and documents the characteristics of each connection from an information system to other information systems outside the organization."

      check "1" {
        title = "[Preview]: Network traffic data collection agent should be installed on Linux virtual machines"
        doc   = file("hipaa_hitrust_v9.2/docs/0836_09_n2organizational_1_09_n_1.md")
        query = file("queries/compute/linux_machines_without_data_collection_agent.sql")
      }
    }

    policy "0837_09_n2organizational_2_09_n" {
      title = "Formal agreements with external information system providers include specific obligations for security and privacy."

      check "1" {
        title = "Network Watcher should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/0837_09_n2organizational_2_09_n_1.md")
        query = file("queries/account/locations_without_network_watchers.sql")
      }
    }

    policy "0885_09n2organizational_3_09_n" {
      title = "The organization reviews and updates the interconnection security agreements on an ongoing basis verifying enforcement of security requirements."

      check "1" {
        title = "[Preview]: Network traffic data collection agent should be installed on Linux virtual machines"
        doc   = file("hipaa_hitrust_v9.2/docs/0885_09n2organizational_3_09_n_1.md")
        query = file("queries/compute/linux_machines_without_data_collection_agent.sql")
      }
    }

    policy "0886_09n2organizational_4_09_n" {
      title = "The organization employs and documents in a formal agreement or other document, either i) allow-all, deny-by-exception, or, ii) deny-all, permit-by-exception (preferred), policy for allowing specific information systems to connect to external information systems."

      check "1" {
        title = "Network Watcher should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/0886_09n2organizational_4_09_n_1.md")
        query = file("queries/account/locations_without_network_watchers.sql")
      }
    }

    policy "0887_09n2organizational_5_09_n" {
      title = "The organization requires external/outsourced service providers to identify the specific functions, ports, and protocols used in the provision of the external/outsourced services."

      check "1" {
        title = "[Preview]: Network traffic data collection agent should be installed on Windows virtual machines"
        doc   = file("hipaa_hitrust_v9.2/docs/0887_09n2organizational_5_09_n_1.md")
        query = file("queries/compute/windows_machines_without_data_collection_agent.sql")
      }
    }

    policy "0888_09n2organizational_6_09_n" {
      title = "The contract with the external/outsourced service provider includes the specification that the service provider is responsible for the protection of covered information shared."

      check "1" {
        title = "Network Watcher should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/0888_09n2organizational_6_09_n_1.md")
        query = file("queries/account/locations_without_network_watchers.sql")
      }
    }
  }

  policy "management_of_removable_media" {
    title = "Management of Removable Media"

    policy "0301_09o1organizational_123_09_o" {
      title = "The organization, based on the data classification level, registers media (including laptops) prior to use, places reasonable restrictions on how such media be used, and provides an appropriate level of physical and logical protection (including encryption) for media containing covered information until properly destroyed or sanitized."

      check "1" {
        title = "Transparent Data Encryption on SQL databases should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/0301_09o1organizational_123_09_o_1.md")
        query = file("queries/sql/data_encryption_off.sql")
      }
    }

    policy "0302_09o2organizational_1_09_o" {
      title = "The organization protects and controls media containing sensitive information during transport outside of controlled areas."

      check "1" {
        title = "Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources"
        doc   = file("hipaa_hitrust_v9.2/docs/0302_09o2organizational_1_09_o_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0304_09o3organizational_1_09_o" {
      title = "The organization restricts the use of writable removable media and personally-owned removable media in organizational systems."

      check "1" {
        title = "Require encryption on Data Lake Store accounts"
        doc   = file("hipaa_hitrust_v9.2/docs/0304_09o3organizational_1_09_o_1.md")
        query = file("queries/datalake/not_encrypted_storage_accounts.sql")
      }

      check "2" {
        title = "SQL managed instances should use customer-managed keys to encrypt data at rest"
        doc   = file("hipaa_hitrust_v9.2/docs/0304_09o3organizational_1_09_o_2.md")
        query = file("queries/sql/managed_instances_without_cmk_at_rest.sql")
      }

      check "3" {
        title = "SQL servers should use customer-managed keys to encrypt data at rest"
        doc   = file("hipaa_hitrust_v9.2/docs/0304_09o3organizational_1_09_o_3.md")
        query = file("queries/sql/sqlserver_tde_not_encrypted_with_cmek.sql")
      }
    }
  }

  policy "information_exchange_policies_and_procedures" {
    title = "Information Exchange Policies and Procedures"

    policy "0662_09scsporganizational_2_09_s" {
      title = "Cloud service providers use an industry-recognized virtualization platform and standard virtualization formats (e.g., Open Virtualization Format, OVF) to help ensure interoperability, and has documented custom changes made to any hypervisor in use and all solution-specific virtualization hooks available for customer review."

      check "1" {
        title = "Ensure WEB app has 'Client Certificates (Incoming client certificates)' set to 'On'"
        doc   = file("hipaa_hitrust_v9.2/docs/0662_09scsporganizational_2_09_s_1.md")
        query = file("queries/web/app_client_cert_disabled.sql")
      }
    }

    policy "0901_09s1organizational_1_09_s" {
      title = "The organization formally addresses multiple safeguards before allowing the use of information systems for information exchange."

      check "1" {
        title = "CORS should not allow every resource to access your Web Applications"
        doc   = file("hipaa_hitrust_v9.2/docs/0901_09s1organizational_1_09_s_1.md")
        query = file("queries/web/cors_should_not_allow_every_resource_to_access_your_web_applications.sql")
      }
    }

    policy "0902_09s2organizational_13_09_s" {
      title = "Remote (external) access to the organization's information assets and access to external information assets (for which the organization has no control) is based on clearly defined terms and conditions."

      check "1" {
        title = "CORS should not allow every resource to access your Function Apps"
        doc   = file("hipaa_hitrust_v9.2/docs/0902_09s2organizational_13_09_s_1.md")
        query = file("queries/web/cors_should_not_allow_every_resource_to_access_your_function_apps.sql")
      }
    }

    policy "0911_09s1organizational_2_09_s" {
      title = "The organization establishes terms and conditions, consistent with any trust relationship established with other organizations owning, operating, and/or maintaining external information systems, allowing authorized individuals to (i) access the information system from external information systems; and (ii) process, store or transmit organization-controlled information using external information systems."

      check "1" {
        title = "CORS should not allow every resource to access your API App"
        doc   = file("hipaa_hitrust_v9.2/docs/0911_09s1organizational_2_09_s_1.md")
        query = file("queries/web/cors_should_not_allow_every_resource_to_access_your_api_app.sql")
      }
    }

    policy "0912_09s1organizational_4_09_s" {
      title = "Cryptography is used to protect the confidentiality and integrity of remote access sessions to the internal network and to external systems."

      check "1" {
        title = "Remote debugging should be turned off for Web Applications"
        doc   = file("hipaa_hitrust_v9.2/docs/0912_09s1organizational_4_09_s_1.md")
        query = file("queries/web/remote_debugging_should_be_turned_off_for_web_applications.sql")
      }
    }

    policy "0913_09s1organizational_5_09_s" {
      title = "Strong cryptography protocols are used to safeguard covered information during transmission over less trusted / open public networks."

      check "1" {
        title = "Remote debugging should be turned off for Function Apps"
        doc   = file("hipaa_hitrust_v9.2/docs/0913_09s1organizational_5_09_s_1.md")
        query = file("queries/web/remote_debugging_should_be_turned_off_for_function_apps.sql")
      }
    }

    policy "0914_09s1organizational_6_09_s" {
      title = "The organization ensures that communication protection requirements, including the security of exchanges of information, is the subject of policy development and compliance audits."

      check "1" {
        title = "Remote debugging should be turned off for API Apps"
        doc   = file("hipaa_hitrust_v9.2/docs/0914_09s1organizational_6_09_s_1.md")
        query = file("queries/web/remote_debugging_should_be_turned_off_for_api_apps.sql")
      }
    }

    policy "0915_09s2organizational_2_09_s" {
      title = "The organization limits the use of organization-controlled portable storage media by authorized individuals on external information systems."

      check "1" {
        title = "Ensure WEB app has 'Client Certificates (Incoming client certificates)' set to 'On'"
        doc   = file("hipaa_hitrust_v9.2/docs/0915_09s2organizational_2_09_s_1.md")
        query = file("queries/web/app_client_cert_disabled.sql")
      }
    }

    policy "0916_09s2organizational_4_09_s" {
      title = "The information system prohibits remote activation of collaborative computing devices and provides an explicit indication of use to users physically present at the devices."

      check "1" {
        title = "CORS should not allow every resource to access your Web Applications"
        doc   = file("hipaa_hitrust_v9.2/docs/0916_09s2organizational_4_09_s_1.md")
        query = file("queries/web/cors_should_not_allow_every_resource_to_access_your_web_applications.sql")
      }
    }

    policy "0960_09scsporganizational_1_09_s" {
      title = "Cloud service providers use secure (e.g., non-clear text and authenticated) standardized network protocols for the import and export of data and to manage the service, and make available a document to consumers (tenants) detailing the relevant interoperability and portability standards that are involved."

      check "1" {
        title = "CORS should not allow every resource to access your Function Apps"
        doc   = file("hipaa_hitrust_v9.2/docs/0960_09scsporganizational_1_09_s_1.md")
        query = file("queries/web/cors_should_not_allow_every_resource_to_access_your_function_apps.sql")
      }
    }

    policy "1325_09s1organizational_3_09_s" {
      title = "Personnel are appropriately trained on leading principles and practices for all types of information exchange (oral, paper and electronic)."

      check "1" {
        title = "Remote debugging should be turned off for Function Apps"
        doc   = file("hipaa_hitrust_v9.2/docs/1325_09s1organizational_3_09_s_1.md")
        query = file("queries/web/remote_debugging_should_be_turned_off_for_function_apps.sql")
      }
    }
  }

  policy "on_line_transactions" {
    title = "On-line Transactions"

    policy "0943_09y1organizational_1_09_y" {
      title = "Data involved in electronic commerce and online transactions is checked to determine if it contains covered information."

      check "1" {
        title = "Secure transfer to storage accounts should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/0943_09y1organizational_1_09_y_1.md")
        query = file("queries/storage/secure_transfer_to_storage_accounts_should_be_enabled.sql")
      }
    }

    policy "0945_09y1organizational_3_09_y" {
      title = "Protocols used to communicate between all involved parties are secured using cryptographic techniques (e.g., SSL)."

      check "1" {
        title = "Audit Windows machines that do not contain the specified certificates in Trusted Root"
        doc   = file("hipaa_hitrust_v9.2/docs/0945_09y1organizational_3_09_y_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0946_09y2organizational_14_09_y" {
      title = "The organization requires the use of encryption between, and the use of electronic signatures by, each of the parties involved in the transaction."

      check "1" {
        title = "Only secure connections to your Azure Cache for Redis should be enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/0946_09y2organizational_14_09_y_1.md")
        query = file("queries/redis/only_secure_connections_to_your_azure_cache_for_redis_should_be_enabled.sql")
      }
    }

    policy "0947_09y2organizational_2_09_y" {
      title = "The organization ensures the storage of the transaction details are located outside of any publicly accessible environments (e.g., on a storage platform existing on the organization's intranet) and not retained and exposed on a storage medium directly accessible from the Internet."

      check "1" {
        title = "Enforce SSL connection should be enabled for PostgreSQL database servers"
        doc   = file("hipaa_hitrust_v9.2/docs/0947_09y2organizational_2_09_y_1.md")
        query = file("queries/postgresql/enforce_ssl_connection_should_be_enabled_for_postgresql_database_servers.sql")
      }
    }

    policy "0948_09y2organizational_3_09_y" {
      title = "Where a trusted authority is used (e.g., for the purposes of issuing and maintaining digital signatures and/or digital certificates), security is integrated and embedded throughout the entire end-to-end certificate/signature management process."

      check "1" {
        title = "Enforce SSL connection should be enabled for MySQL database servers"
        doc   = file("hipaa_hitrust_v9.2/docs/0948_09y2organizational_3_09_y_1.md")
        query = file("queries/mysql/enforce_ssl_connection_should_be_enabled_for_mysql_database_servers.sql")
      }
    }

    policy "0949_09y2organizational_5_09_y" {
      title = "The protocols used for communications are enhanced to address any new vulnerability, and the updated versions of the protocols are adopted as soon as possible."

      check "1" {
        title = "API App should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0949_09y2organizational_5_09_y_1.md")
        query = file("queries/web/api_app_should_only_be_accessible_over_https.sql")
      }

      check "2" {
        title = "Function App should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0949_09y2organizational_5_09_y_2.md")
        query = file("queries/web/function_app_should_only_be_accessible_over_https.sql")
      }

      check "3" {
        title = "Latest TLS version should be used in your API App"
        doc   = file("hipaa_hitrust_v9.2/docs/0949_09y2organizational_5_09_y_3.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_api_app.sql")
      }

      check "4" {
        title = "Latest TLS version should be used in your Function App"
        doc   = file("hipaa_hitrust_v9.2/docs/0949_09y2organizational_5_09_y_4.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_function_app.sql")
      }

      check "5" {
        title = "Latest TLS version should be used in your Web App"
        doc   = file("hipaa_hitrust_v9.2/docs/0949_09y2organizational_5_09_y_5.md")
        query = file("queries/web/latest_tls_version_should_be_used_in_your_web_app.sql")
      }

      check "6" {
        title = "Web Application should only be accessible over HTTPS"
        doc   = file("hipaa_hitrust_v9.2/docs/0949_09y2organizational_5_09_y_6.md")
        query = file("queries/web/web_application_should_only_be_accessible_over_https.sql")
      }
    }
  }

  policy "control_of_operational_software" {
    title = "Control of Operational Software"

    policy "0605_10h1system_12_10_h" {
      title = "Only authorized administrators are allowed to implement approved upgrades to software, applications, and program libraries, based on business requirements and the security implications of the release."

      check "1" {
        title = "Vulnerabilities in security configuration on your machines should be remediated"
        doc   = file("hipaa_hitrust_v9.2/docs/0605_10h1system_12_10_h_1.md")
        query = file("queries/manual.sql")
      }

      check "2" {
        title = "Windows machines should meet requirements for 'Security Options_Audit'"
        doc   = file("hipaa_hitrust_v9.2/docs/0605_10h1system_12_10_h_2.md")
        query = file("queries/manual.sql")
      }

      check "3" {
        title = "Windows machines should meet requirements for 'System Audit Policies_Account Management'"
        doc   = file("hipaa_hitrust_v9.2/docs/0605_10h1system_12_10_h_3.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0606_10h2system_1_10_h" {
      title = "Applications and operating systems are successfully tested for usability, security and impact prior to production."

      check "1" {
        title = "Vulnerabilities in container security configurations should be remediated"
        doc   = file("hipaa_hitrust_v9.2/docs/0606_10h2system_1_10_h_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0607_10h2system_23_10_h" {
      title = "The organization uses its configuration control program to maintain control of all implemented software and its system documentation and archive prior versions of implemented software and associated system documentation."

      check "1" {
        title = "Adaptive application controls for defining safe applications should be enabled on your machines"
        doc   = file("hipaa_hitrust_v9.2/docs/0607_10h2system_23_10_h_1.md")
        query = file("queries/manual.sql")
      }

      check "2" {
        title = "Vulnerabilities in security configuration on your virtual machine scale sets should be remediated"
        doc   = file("hipaa_hitrust_v9.2/docs/0607_10h2system_23_10_h_2.md")
        query = file("queries/manual.sql")
      }
    }
  }

  policy "change_control_procedures" {
    title = "Change Control Procedures"

    policy "0635_10k1organizational_12_10_k" {
      title = "Managers responsible for application systems are also responsible for the strict control (security) of the project or support environment and ensure that all proposed system changes are reviewed to check that they do not compromise the security of either the system or the operating environment."

      check "1" {
        title = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        doc   = file("hipaa_hitrust_v9.2/docs/0635_10k1organizational_12_10_k_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0636_10k2organizational_1_10_k" {
      title = "The organization formally addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance for configuration management (e.g., through policies, standards, processes)."

      check "1" {
        title = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        doc   = file("hipaa_hitrust_v9.2/docs/0636_10k2organizational_1_10_k_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0637_10k2organizational_2_10_k" {
      title = "The organization has developed, documented, and implemented a configuration management plan for the information system."

      check "1" {
        title = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        doc   = file("hipaa_hitrust_v9.2/docs/0637_10k2organizational_2_10_k_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0638_10k2organizational_34569_10_k" {
      title = "Changes are formally controlled, documented and enforced in order to minimize the corruption of information systems."

      check "1" {
        title = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        doc   = file("hipaa_hitrust_v9.2/docs/0638_10k2organizational_34569_10_k_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0639_10k2organizational_78_10_k" {
      title = "Installation checklists and vulnerability scans are used to validate the configuration of servers, workstations, devices and appliances and ensure the configuration meets minimum standards."

      check "1" {
        title = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        doc   = file("hipaa_hitrust_v9.2/docs/0639_10k2organizational_78_10_k_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0640_10k2organizational_1012_10_k" {
      title = "Where development is outsourced, change control procedures to address security are included in the contract(s) and specifically require the developer to track security flaws and flaw resolution within the system, component, or service and report findings to organization-defined personnel or roles."

      check "1" {
        title = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        doc   = file("hipaa_hitrust_v9.2/docs/0640_10k2organizational_1012_10_k_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0641_10k2organizational_11_10_k" {
      title = "The organization does not use automated updates on critical systems."

      check "1" {
        title = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        doc   = file("hipaa_hitrust_v9.2/docs/0641_10k2organizational_11_10_k_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0642_10k3organizational_12_10_k" {
      title = "The organization develops, documents, and maintains, under configuration control, a current baseline configuration of the information system, and reviews and updates the baseline as required."

      check "1" {
        title = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        doc   = file("hipaa_hitrust_v9.2/docs/0642_10k3organizational_12_10_k_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0643_10k3organizational_3_10_k" {
      title = "The organization (i) establishes and documents mandatory configuration settings for information technology products employed within the information system using the latest security configuration baselines; (ii) identifies, documents, and approves exceptions from the mandatory established configuration settings for individual components based on explicit operational requirements; and (iii) monitors and controls changes to the configuration settings in accordance with organizational policies and procedures."

      check "1" {
        title = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        doc   = file("hipaa_hitrust_v9.2/docs/0643_10k3organizational_3_10_k_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0644_10k3organizational_4_10_k" {
      title = "The organization employs automated mechanisms to (i) centrally manage, apply, and verify configuration settings; (ii) respond to unauthorized changes to network and system security-related configuration settings; and (iii) enforce access restrictions and auditing of the enforcement actions."

      check "1" {
        title = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        doc   = file("hipaa_hitrust_v9.2/docs/0644_10k3organizational_4_10_k_1.md")
        query = file("queries/manual.sql")
      }
    }
  }

  policy "control_of_technical_vulnerabilities" {
    title = "Control of Technical Vulnerabilities"

    policy "0709_10m1organizational_1_10_m" {
      title = "Technical vulnerabilities are identified, evaluated for risk and corrected in a timely manner."

      check "1" {
        title = "A vulnerability assessment solution should be enabled on your virtual machines"
        doc   = file("hipaa_hitrust_v9.2/docs/0709_10m1organizational_1_10_m_1.md")
        query = file("queries/compute/machines_without_vulnerability_assessment_extension.sql")
      }

      check "2" {
        title = "SQL databases should have vulnerability findings resolved"
        doc   = file("hipaa_hitrust_v9.2/docs/0709_10m1organizational_1_10_m_2.md")
        query = file("queries/sql/sql_databases_with_unresolved_vulnerability_findings.sql")
      }

      check "3" {
        title = "Vulnerabilities in container security configurations should be remediated"
        doc   = file("hipaa_hitrust_v9.2/docs/0709_10m1organizational_1_10_m_3.md")
        query = file("queries/manual.sql") #manual
      }

      check "4" {
        title = "Vulnerabilities in security configuration on your machines should be remediated"
        doc   = file("hipaa_hitrust_v9.2/docs/0709_10m1organizational_1_10_m_4.md")
        query = file("queries/manual.sql") #manual
      }

      check "5" {
        title = "Vulnerabilities in security configuration on your virtual machine scale sets should be remediated"
        doc   = file("hipaa_hitrust_v9.2/docs/0709_10m1organizational_1_10_m_5.md")
        query = file("queries/manual.sql") #manual
      }

      check "6" {
        title = "Vulnerability assessment should be enabled on SQL Managed Instance"
        doc   = file("hipaa_hitrust_v9.2/docs/0709_10m1organizational_1_10_m_6.md")
        query = file("queries/sql/managed_instances_without_vulnerability_assessments.sql")
      }

      check "7" {
        title = "Vulnerability assessment should be enabled on your SQL servers"
        doc   = file("hipaa_hitrust_v9.2/docs/0709_10m1organizational_1_10_m_7.md")
        query = file("queries/sql/servers_without_vulnerability_assessments.sql")
      }

      check "8" {
        title = "Windows machines should meet requirements for 'Security Options_Microsoft Network Server'"
        doc   = file("hipaa_hitrust_v9.2/docs/0709_10m1organizational_1_10_m_8.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0710_10m2organizational_1_10_m" {
      title = "A hardened configuration standard exists for all system and network components."

      check "1" {
        title = "Vulnerability assessment should be enabled on SQL Managed Instance"
        doc   = file("hipaa_hitrust_v9.2/docs/0710_10m2organizational_1_10_m_1.md")
        query = file("queries/sql/managed_instances_without_vulnerability_assessments.sql")
      }
    }

    policy "0711_10m2organizational_23_10_m" {
      title = "A technical vulnerability management program is in place to monitor, assess, rank, and remediate vulnerabilities identified in systems."

      check "1" {
        title = "A vulnerability assessment solution should be enabled on your virtual machines"
        doc   = file("hipaa_hitrust_v9.2/docs/0711_10m2organizational_23_10_m_1.md")
        query = file("queries/compute/machines_without_vulnerability_assessment_extension.sql")
      }
    }

    policy "0713_10m2organizational_5_10_m" {
      title = "Patches are tested and evaluated before they are installed."

      check "1" {
        title = "Vulnerabilities in security configuration on your machines should be remediated"
        doc   = file("hipaa_hitrust_v9.2/docs/0713_10m2organizational_5_10_m_1.md")
        query = file("queries/manual.sql") #manual
      }
    }

    policy "0714_10m2organizational_7_10_m" {
      title = "The technical vulnerability management program is evaluated on a quarterly basis."

      check "1" {
        title = "Vulnerabilities in security configuration on your virtual machine scale sets should be remediated"
        doc   = file("hipaa_hitrust_v9.2/docs/0714_10m2organizational_7_10_m_1.md")
        query = file("queries/manual.sql") #manual
      }
    }

    policy "0715_10m2organizational_8_10_m" {
      title = "Systems are appropriately hardened (e.g., configured with only necessary and secure services, ports and protocols enabled)."

      check "1" {
        title = "Vulnerabilities in container security configurations should be remediated"
        doc   = file("hipaa_hitrust_v9.2/docs/0715_10m2organizational_8_10_m_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0716_10m3organizational_1_10_m" {
      title = "The organization conducts an enterprise security posture review as needed but no less than once within every three-hundred-sixty-five (365) days, in accordance with organizational IS procedures."

      check "1" {
        title = "SQL databases should have vulnerability findings resolved"
        doc   = file("hipaa_hitrust_v9.2/docs/0716_10m3organizational_1_10_m_1.md")
        query = file("queries/sql/sql_databases_with_unresolved_vulnerability_findings.sql")
      }
    }

    policy "0717_10m3organizational_2_10_m" {
      title = "Vulnerability scanning tools include the capability to readily update the information system vulnerabilities scanned."

      check "1" {
        title = "Vulnerabilities in security configuration on your virtual machine scale sets should be remediated"
        doc   = file("hipaa_hitrust_v9.2/docs/0717_10m3organizational_2_10_m_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0718_10m3organizational_34_10_m" {
      title = "The organization scans for vulnerabilities in the information system and hosted applications to determine the state of flaw remediation monthly (automatically) and again (manually or automatically) when new vulnerabilities potentially affecting the systems and networked environments are identified and reported."

      check "1" {
        title = "Vulnerabilities in security configuration on your machines should be remediated"
        doc   = file("hipaa_hitrust_v9.2/docs/0718_10m3organizational_34_10_m_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "0719_10m3organizational_5_10_m" {
      title = "The organization updates the list of information system vulnerabilities scanned within every thirty (30) days or when new vulnerabilities are identified and reported."

      check "1" {
        title = "Vulnerability assessment should be enabled on SQL Managed Instance"
        doc   = file("hipaa_hitrust_v9.2/docs/0719_10m3organizational_5_10_m_1.md")
        query = file("queries/sql/managed_instances_without_vulnerability_assessments.sql")
      }
    }
  }

  policy "business_continuity_and_risk_assessment" {
    title = "Business Continuity and Risk Assessment"

    policy "1634_12b1organizational_1_12_b" {
      title = "The organization identifies the critical business processes requiring business continuity."

      check "1" {
        title = "Audit virtual machines without disaster recovery configured"
        doc   = file("hipaa_hitrust_v9.2/docs/1634_12b1organizational_1_12_b_1.md")
        query = file("queries/compute/audit_virtual_machines_without_disaster_recovery_configured.sql")
      }
    }

    policy "1635_12b1organizational_2_12_b" {
      title = "Information security aspects of business continuity are (i) based on identifying events (or sequence of events) that can cause interruptions to the organization's critical business processes (e.g., equipment failure, human errors, theft, fire, natural disasters acts of terrorism); (ii) followed by a risk assessment to determine the probability and impact of such interruptions, in terms of time, damage scale and recovery period; (iii) based on the results of the risk assessment, a business continuity strategy is developed to identify the overall approach to business continuity; and (iv) once this strategy has been created, endorsement is provided by management, and a plan created and endorsed to implement this strategy."

      check "1" {
        title = "Azure Key Vault Managed HSM should have purge protection enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1635_12b1organizational_2_12_b_1.md")
        query = file("queries/keyvault/azure_key_vault_managed_hsm_should_have_purge_protection_enabled.sql")
      }

      check "2" {
        title = "Key vaults should have purge protection enabled"
        doc   = file("hipaa_hitrust_v9.2/docs/1635_12b1organizational_2_12_b_2.md")
        query = file("queries/keyvault/not_recoverable.sql")
      }
    }

    policy "1637_12b2organizational_2_12_b" {
      title = "Business impact analysis are used to evaluate the consequences of disasters, security failures, loss of service, and service availability."

      check "1" {
        title = "Windows machines should meet requirements for 'Security Options_Recovery console'"
        doc   = file("hipaa_hitrust_v9.2/docs/1637_12b2organizational_2_12_b_1.md")
        query = file("queries/manual.sql")
      }
    }

    policy "1638_12b2organizational_345_12_b" {
      title = "Business continuity risk assessments (i) are carried out annually with full involvement from owners of business resources and processes; (ii) consider all business processes and is not limited to the information assets, but includes the results specific to information security; and (iii) identifies, quantifies, and prioritizes risks against key business objectives and criteria relevant to the organization, including critical resources, impacts of disruptions, allowable outage times, and recovery priorities."

      check "1" {
        title = "Audit virtual machines without disaster recovery configured"
        doc   = file("hipaa_hitrust_v9.2/docs/1638_12b2organizational_345_12_b_1.md")
        query = file("queries/compute/audit_virtual_machines_without_disaster_recovery_configured.sql")
      }
    }
  }
}
