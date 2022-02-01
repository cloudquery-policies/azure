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
        title       = "Management ports of virtual machines should be protected with just-in-time network access control"
        description = "Possible network Just In Time (JIT) access will be monitored by Azure Security Center as recommendations"
        query       = file("queries/manual.sql")
      }
    }

    policy "1143_01c1system_123_01_c" {
      title = "Privileges are formally authorized and controlled, allocated to users on a need-to-use and event-by-event basis for their functional role (e.g., user or administrator), and documented for each system product/element."

      check "1" {
        title       = "Management ports should be closed on your virtual machines"
        description = "Open remote management ports are exposing your VM to a high level of risk from Internet-based attacks. These attacks attempt to brute force credentials to gain admin access to the machine."
        query       = file("queries/manual.sql")
      }
    }

    policy "1144_01c1system_4_01_c" {
      title = "The organization explicitly authorizes access to specific security relevant functions (deployed in hardware, software, and firmware) and security-relevant information."

      check "1" {
        title       = "A maximum of 3 owners should be designated for your subscription"
        description = "It is recommended to designate up to 3 subscription owners in order to reduce the potential for breach by a compromised owner."
        query       = file("queries/manual.sql")
      }
    }

    policy "1145_01c2system_1_01_c" {
      title = "Role-based access control is implemented and capable of mapping each user to one or more roles, and each role to one or more system functions."

      check "1" {
        title       = "There should be more than one owner assigned to your subscription"
        description = "It is recommended to designate more than one subscription owner in order to have administrator access redundancy."
        query       = file("queries/manual.sql")
      }
    }

    policy "1146_01c2system_23_01_c" {
      title = "The organization promotes the development and use of programs that avoid the need to run with elevated privileges and system routines to avoid the need to grant privileges to users."

      check "1" {
        title       = "External accounts with owner permissions should be removed from your subscription"
        description = "External accounts with owner permissions should be removed from your subscription in order to prevent unmonitored access."
        query       = file("queries/manual.sql")
      }
    }

    policy "1147_01c2system_456_01_c" {
      title = "Elevated privileges are assigned to a different user ID from those used for normal business use, all users access privileged services in a single role, and such privileged access is minimized."

      check "1" {
        title       = "Deprecated accounts with owner permissions should be removed from your subscription"
        description = "Deprecated accounts with owner permissions should be removed from your subscription. Deprecated accounts are accounts that have been blocked from signing in."
        query       = file("queries/manual.sql")
      }
    }

    policy "1148_01c2system_78_01_c" {
      title = "The organization restricts access to privileged functions and all security-relevant information."

      check "1" {
        title       = "Audit usage of custom RBAC rules"
        description = "Audit built-in roles such as 'Owner, Contributer, Reader' instead of custom RBAC roles, which are error prone. Using custom roles is treated as an exception and requires a rigorous review and threat modeling"
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "Windows machines should meet requirements for 'Security Options_Accounts'"
        description = "Windows machines should have the specified Group Policy settings in the category 'Security Options_Accounts' for limiting local account use of blank passwords and guest account status. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }

    policy "1149_01c2system_9_01_c" {
      title = "The organization facilitates information sharing by enabling authorized users to determine a business partner's access when discretion is allowed as defined by the organization and by employing manual processes or automated mechanisms to assist users in making information sharing/collaboration decisions."

      check "1" {
        title       = "Role-Based Access Control (RBAC) should be used on Kubernetes Services"
        description = "To provide granular filtering on the actions that users can perform, use Role-Based Access Control (RBAC) to manage permissions in Kubernetes Service Clusters and configure relevant authorization policies."
        query       = file("queries/manual.sql")
      }
    }

    policy "1150_01c2system_10_01_c" {
      title = "The access control system for the system components storing, processing or transmitting covered information is set with a default \"deny-all\" setting."

      check "1" {
        title       = "Management ports should be closed on your virtual machines"
        description = "Open remote management ports are exposing your VM to a high level of risk from Internet-based attacks. These attacks attempt to brute force credentials to gain admin access to the machine."
        query       = file("queries/manual.sql")
      }
    }

    policy "1151_01c3system_1_01_c" {
      title = "The organization limits authorization to privileged accounts on information systems to a pre-defined subset of users."

      check "1" {
        title       = "A maximum of 3 owners should be designated for your subscription"
        description = "It is recommended to designate up to 3 subscription owners in order to reduce the potential for breach by a compromised owner."
        query       = file("queries/manual.sql")
      }
    }

    policy "1152_01c3system_2_01_c" {
      title = "The organization audits the execution of privileged functions on information systems and ensures information systems prevent non-privileged users from executing privileged functions."

      check "1" {
        title       = "There should be more than one owner assigned to your subscription"
        description = "It is recommended to designate more than one subscription owner in order to have administrator access redundancy."
        query       = file("queries/manual.sql")
      }
    }

    policy "1153_01c3system_35_01_c" {
      title = "All file system access not explicitly required is disabled, and only authorized users are permitted access to only that which is expressly required for the performance of the users' job duties."

      check "1" {
        title       = "Role-Based Access Control (RBAC) should be used on Kubernetes Services"
        description = "To provide granular filtering on the actions that users can perform, use Role-Based Access Control (RBAC) to manage permissions in Kubernetes Service Clusters and configure relevant authorization policies."
        query       = file("queries/manual.sql")
      }
    }

    policy "1154_01c3system_4_01_c" {
      title = "Contractors are provided with minimal system and physical access only after the organization assesses the contractor's ability to comply with its security requirements and the contractor agrees to comply."

      check "1" {
        title       = "A maximum of 3 owners should be designated for your subscription"
        description = "It is recommended to designate up to 3 subscription owners in order to reduce the potential for breach by a compromised owner."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "user_authentication_for_external_connections" {
    title = "User Authentication for External Connections"

    policy "1116_01j1organizational_145_01_j" {
      title = "Strong authentication methods such as multi-factor, Radius or Kerberos (for privileged access) and CHAP (for encryption of credentials for dialup methods) are implemented for all external connections to the organizations network."

      check "1" {
        title       = "MFA should be enabled on accounts with owner permissions on your subscription"
        description = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with owner permissions to prevent a breach of accounts or resources."
        query       = file("queries/manual.sql")
      }
    }

    policy "1117_01j1organizational_23_01_j" {
      title = "Remote access by vendors and business partners (e.g., for remote maintenance) is disabled/deactivated when not in use."

      check "1" {
        title       = "MFA should be enabled accounts with write permissions on your subscription"
        description = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with write privileges to prevent a breach of accounts or resources."
        query       = file("queries/manual.sql")
      }
    }

    policy "1118_01j2organizational_124_01_j" {
      title = "Organizations implement encryption (e.g.  VPN solutions or private lines) and logs remote access to the organization's network by employees, contractors or third party (e.g., vendors)."

      check "1" {
        title       = "MFA should be enabled on accounts with read permissions on your subscription"
        description = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with read privileges to prevent a breach of accounts or resources."
        query       = file("queries/manual.sql")
      }
    }

    policy "1119_01j2organizational_3_01_j" {
      title = "Network equipment is checked for unanticipated dial-up capabilities."

      check "1" {
        title       = "Management ports of virtual machines should be protected with just-in-time network access control"
        description = "Possible network Just In Time (JIT) access will be monitored by Azure Security Center as recommendations"
        query       = file("queries/manual.sql")
      }
    }

    policy "1121_01j3organizational_2_01_j" {
      title = "Remote administration sessions are authorized, encrypted, and employ increased security measures."

      check "1" {
        title       = "MFA should be enabled on accounts with owner permissions on your subscription"
        description = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with owner permissions to prevent a breach of accounts or resources."
        query       = file("queries/manual.sql")
      }
    }

    policy "1173_01j1organizational_6_01_j" {
      title = "If encryption is not used for dial-up connections, the CIO or his/her designated representative provides specific written authorization."

      check "1" {
        title       = "MFA should be enabled accounts with write permissions on your subscription"
        description = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with write privileges to prevent a breach of accounts or resources."
        query       = file("queries/manual.sql")
      }
    }

    policy "1174_01j1organizational_7_01_j" {
      title = "The organization protects wireless access to systems containing sensitive information by authenticating both users and devices."

      check "1" {
        title       = "MFA should be enabled on accounts with read permissions on your subscription"
        description = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with read privileges to prevent a breach of accounts or resources."
        query       = file("queries/manual.sql")
      }
    }

    policy "1175_01j1organizational_8_01_j" {
      title = "Remote access to business information across public networks only takes place after successful identification and authentication."

      check "1" {
        title       = "Management ports of virtual machines should be protected with just-in-time network access control"
        description = "Possible network Just In Time (JIT) access will be monitored by Azure Security Center as recommendations"
        query       = file("queries/manual.sql")
      }
    }

    policy "1176_01j2organizational_5_01_j" {
      title = "The organization requires a callback capability with re-authentication to verify dial-up connections from authorized locations."

      check "1" {
        title       = "MFA should be enabled on accounts with owner permissions on your subscription"
        description = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with owner permissions to prevent a breach of accounts or resources."
        query       = file("queries/manual.sql")
      }
    }

    policy "1177_01j2organizational_6_01_j" {
      title = "User IDs assigned to vendors are reviewed in accordance with the organization's access review policy, at a minimum annually."

      check "1" {
        title       = "MFA should be enabled accounts with write permissions on your subscription"
        description = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with write privileges to prevent a breach of accounts or resources."
        query       = file("queries/manual.sql")
      }
    }

    policy "1178_01j2organizational_7_01_j" {
      title = "Node authentication, including cryptographic techniques (e.g., machine certificates), serves as an alternative means of authenticating groups of remote users where they are connected to a secure, shared computer facility."

      check "1" {
        title       = "MFA should be enabled on accounts with read permissions on your subscription"
        description = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with read privileges to prevent a breach of accounts or resources."
        query       = file("queries/manual.sql")
      }
    }

    policy "1179_01j3organizational_1_01_j" {
      title = "The information system monitors and controls remote access methods."

      check "1" {
        title       = "Management ports of virtual machines should be protected with just-in-time network access control"
        description = "Possible network Just In Time (JIT) access will be monitored by Azure Security Center as recommendations"
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "remote_diagnostic_and_configuration_port_protection" {
    title = "Remote Diagnostic and Configuration Port Protection"

    policy "1192_01l1organizational_1_01_l" {
      title = "Access to network equipment is physically protected."

      check "1" {
        title       = "Management ports of virtual machines should be protected with just-in-time network access control"
        description = "Possible network Just In Time (JIT) access will be monitored by Azure Security Center as recommendations"
        query       = file("queries/manual.sql")
      }
    }

    policy "1193_01l2organizational_13_01_l" {
      title = "Controls for the access to diagnostic and configuration ports include the use of a key lock and the implementation of supporting procedures to control physical access to the port."

      check "1" {
        title       = "Management ports should be closed on your virtual machines"
        description = "Open remote management ports are exposing your VM to a high level of risk from Internet-based attacks. These attacks attempt to brute force credentials to gain admin access to the machine."
        query       = file("queries/manual.sql")
      }
    }

    policy "1194_01l2organizational_2_01_l" {
      title = "Ports, services, and similar applications installed on a computer or network systems, which are not specifically required for business functionality, are disabled or removed."

      check "1" {
        title       = "Remote debugging should be turned off for Web Applications"
        description = "Remote debugging requires inbound ports to be opened on a web application. Remote debugging should be turned off."
        query       = file("queries/manual.sql")
      }
    }

    policy "1195_01l3organizational_1_01_l" {
      title = "The organization reviews the information system within every three hundred and sixty- five (365) days to identify and disables unnecessary and non-secure functions, ports, protocols, and/or services."

      check "1" {
        title       = "Remote debugging should be turned off for Function Apps"
        description = "Remote debugging requires inbound ports to be opened on function apps. Remote debugging should be turned off."
        query       = file("queries/manual.sql")
      }
    }

    policy "1196_01l3organizational_24_01_l" {
      title = "The organization identifies unauthorized (blacklisted) software on the information system, prevents program execution in accordance with a list of unauthorized (blacklisted) software programs, employs an allow-all, deny-by exception policy to prohibit execution of known unauthorized (blacklisted) software, and reviews and updates the list of unauthorized (blacklisted) software programs annually."

      check "1" {
        title       = "Remote debugging should be turned off for API Apps"
        description = "Remote debugging requires inbound ports to be opened on API apps. Remote debugging should be turned off."
        query       = file("queries/manual.sql")
      }
    }

    policy "1197_01l3organizational_3_01_l" {
      title = "The organization disables Bluetooth and peer-to-peer networking protocols within the information system determined to be unnecessary or non-secure."

      check "1" {
        title       = "Adaptive application controls for defining safe applications should be enabled on your machines"
        description = "Enable application controls to define the list of known-safe applications running on your machines, and alert you when other applications run. This helps harden your machines against malware. To simplify the process of configuring and maintaining your rules, Security Center uses machine learning to analyze the applications running on each machine and suggest the list of known-safe applications."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "segregation_in_networks" {
    title = "Segregation in Networks"

    policy "0805_01m1organizational_12_01_m" {
      title = "The organization's security gateways (e.g. firewalls) enforce security policies and are configured to filter traffic between domains, block unauthorized access, and are used to maintain segregation between internal wired, internal wireless, and external network segments (e.g., the Internet) including DMZs and enforce access control policies for each of the domains."

      check "1" {
        title       = "[Preview]: Container Registry should use a virtual network service endpoint"
        description = "This policy audits any Container Registry not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "App Service should use a virtual network service endpoint"
        description = "This policy audits any App Service not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "3" {
        title       = "Cosmos DB should use a virtual network service endpoint"
        description = "This policy audits any Cosmos DB not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "4" {
        title       = "Event Hub should use a virtual network service endpoint"
        description = "This policy audits any Event Hub not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "5" {
        title       = "Gateway subnets should not be configured with a network security group"
        description = "This policy denies if a gateway subnet is configured with a network security group. Assigning a network security group to a gateway subnet will cause the gateway to stop functioning."
        query       = file("queries/manual.sql")
      }

      check "6" {
        title       = "Internet-facing virtual machines should be protected with network security groups"
        description = "Protect your virtual machines from potential threats by restricting access to them with network security groups (NSG). Learn more about controlling traffic with NSGs at https://aka.ms/nsg-doc"
        query       = file("queries/manual.sql")
      }

      check "7" {
        title       = "Key Vault should use a virtual network service endpoint"
        description = "This policy audits any Key Vault not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "8" {
        title       = "SQL Server should use a virtual network service endpoint"
        description = "This policy audits any SQL Server not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "9" {
        title       = "Storage Accounts should use a virtual network service endpoint"
        description = "This policy audits any Storage Account not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "10" {
        title       = "Subnets should be associated with a Network Security Group"
        description = "Protect your subnet from potential threats by restricting access to it with a Network Security Group (NSG). NSGs contain a list of Access Control List (ACL) rules that allow or deny network traffic to your subnet."
        query       = file("queries/manual.sql")
      }

      check "11" {
        title       = "Virtual machines should be connected to an approved virtual network"
        description = "This policy audits any virtual machine connected to a virtual network that is not approved."
        query       = file("queries/manual.sql")
      }
    }

    policy "0806_01m2organizational_12356_01_m" {
      title = "The organizations network is logically and physically segmented with a defined security perimeter and a graduated set of controls, including subnetworks for publicly accessible system components that are logically separated from the internal network, based on organizational requirements; and traffic is controlled based on functionality required and classification of the data/systems based on a risk assessment and their respective security requirements."

      check "1" {
        title       = "[Preview]: Container Registry should use a virtual network service endpoint"
        description = "This policy audits any Container Registry not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "App Service should use a virtual network service endpoint"
        description = "This policy audits any App Service not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "3" {
        title       = "Cosmos DB should use a virtual network service endpoint"
        description = "This policy audits any Cosmos DB not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "4" {
        title       = "Event Hub should use a virtual network service endpoint"
        description = "This policy audits any Event Hub not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "5" {
        title       = "Gateway subnets should not be configured with a network security group"
        description = "This policy denies if a gateway subnet is configured with a network security group. Assigning a network security group to a gateway subnet will cause the gateway to stop functioning."
        query       = file("queries/manual.sql")
      }

      check "6" {
        title       = "Internet-facing virtual machines should be protected with network security groups"
        description = "Protect your virtual machines from potential threats by restricting access to them with network security groups (NSG). Learn more about controlling traffic with NSGs at https://aka.ms/nsg-doc"
        query       = file("queries/manual.sql")
      }

      check "7" {
        title       = "Key Vault should use a virtual network service endpoint"
        description = "This policy audits any Key Vault not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "8" {
        title       = "SQL Server should use a virtual network service endpoint"
        description = "This policy audits any SQL Server not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "9" {
        title       = "Storage Accounts should use a virtual network service endpoint"
        description = "This policy audits any Storage Account not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "10" {
        title       = "Subnets should be associated with a Network Security Group"
        description = "Protect your subnet from potential threats by restricting access to it with a Network Security Group (NSG). NSGs contain a list of Access Control List (ACL) rules that allow or deny network traffic to your subnet."
        query       = file("queries/manual.sql")
      }

      check "11" {
        title       = "Virtual machines should be connected to an approved virtual network"
        description = "This policy audits any virtual machine connected to a virtual network that is not approved."
        query       = file("queries/manual.sql")
      }
    }

    policy "0894_01m2organizational_7_01_m" {
      title = "Networks are segregated from production-level networks when migrating physical servers, applications or data to virtualized servers."

      check "1" {
        title       = "[Preview]: Container Registry should use a virtual network service endpoint"
        description = "This policy audits any Container Registry not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "1" {
        title       = "App Service should use a virtual network service endpoint"
        description = "This policy audits any App Service not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "Cosmos DB should use a virtual network service endpoint"
        description = "This policy audits any Cosmos DB not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "3" {
        title       = "Deploy network watcher when virtual networks are created"
        description = "This policy creates a network watcher resource in regions with virtual networks. You need to ensure existence of a resource group named networkWatcherRG, which will be used to deploy network watcher instances."
        query       = file("queries/manual.sql")
      }

      check "4" {
        title       = "Event Hub should use a virtual network service endpoint"
        description = "This policy audits any Event Hub not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "5" {
        title       = "Gateway subnets should not be configured with a network security group"
        description = "This policy denies if a gateway subnet is configured with a network security group. Assigning a network security group to a gateway subnet will cause the gateway to stop functioning."
        query       = file("queries/manual.sql")
      }

      check "6" {
        title       = "Internet-facing virtual machines should be protected with network security groups"
        description = "Protect your virtual machines from potential threats by restricting access to them with network security groups (NSG). Learn more about controlling traffic with NSGs at https://aka.ms/nsg-doc"
        query       = file("queries/manual.sql")
      }

      check "7" {
        title       = "Key Vault should use a virtual network service endpoint"
        description = "This policy audits any Key Vault not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "8" {
        title       = "SQL Server should use a virtual network service endpoint"
        description = "This policy audits any SQL Server not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "9" {
        title       = "Storage Accounts should use a virtual network service endpoint"
        description = "This policy audits any Storage Account not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "10" {
        title       = "Subnets should be associated with a Network Security Group"
        description = "Protect your subnet from potential threats by restricting access to it with a Network Security Group (NSG). NSGs contain a list of Access Control List (ACL) rules that allow or deny network traffic to your subnet."
        query       = file("queries/manual.sql")
      }

      check "11" {
        title       = "Virtual machines should be connected to an approved virtual network"
        description = "This policy audits any virtual machine connected to a virtual network that is not approved."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "network_connection_control" {
    title = "Network Connection Control"

    policy "0809_01n2organizational_1234_01_n" {
      title = "Network traffic is controlled in accordance with the organizations access control policy through firewall and other network-related restrictions for each network access point or external telecommunication service's managed interface."

      check "1" {
        title       = "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
        description = "Azure Security Center analyzes the traffic patterns of Internet facing virtual machines and provides Network Security Group rule recommendations that reduce the potential attack surface"
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "API App should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }

      check "3" {
        title       = "Enforce SSL connection should be enabled for MySQL database servers"
        description = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
        query       = file("queries/manual.sql")
      }

      check "4" {
        title       = "Enforce SSL connection should be enabled for PostgreSQL database servers"
        description = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
        query       = file("queries/manual.sql")
      }

      check "5" {
        title       = "Function App should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }

      check "6" {
        title       = "Internet-facing virtual machines should be protected with network security groups"
        description = "Protect your virtual machines from potential threats by restricting access to them with network security groups (NSG). Learn more about controlling traffic with NSGs at https://aka.ms/nsg-doc"
        query       = file("queries/manual.sql")
      }

      check "7" {
        title       = "Latest TLS version should be used in your API App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "8" {
        title       = "Latest TLS version should be used in your Function App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "9" {
        title       = "Latest TLS version should be used in your Web App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "10" {
        title       = "Only secure connections to your Azure Cache for Redis should be enabled"
        description = "Audit enabling of only connections via SSL to Azure Cache for Redis. Use of secure connections ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
        query       = file("queries/manual.sql")
      }

      check "11" {
        title       = "Secure transfer to storage accounts should be enabled"
        description = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
        query       = file("queries/manual.sql")
      }

      check "12" {
        title       = "Subnets should be associated with a Network Security Group"
        description = "Protect your subnet from potential threats by restricting access to it with a Network Security Group (NSG). NSGs contain a list of Access Control List (ACL) rules that allow or deny network traffic to your subnet."
        query       = file("queries/manual.sql")
      }

      check "13" {
        title       = "Virtual machines should be connected to an approved virtual network"
        description = "This policy audits any virtual machine connected to a virtual network that is not approved."
        query       = file("queries/manual.sql")
      }

      check "14" {
        title       = "Web Application should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }
    }

    policy "0810_01n2organizational_5_01_n" {
      title = "Transmitted information is secured and, at a minimum, encrypted over open, public networks."

      check "1" {
        title       = "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
        description = "Azure Security Center analyzes the traffic patterns of Internet facing virtual machines and provides Network Security Group rule recommendations that reduce the potential attack surface"
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "API App should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }

      check "3" {
        title       = "Enforce SSL connection should be enabled for MySQL database servers"
        description = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
        query       = file("queries/manual.sql")
      }

      check "4" {
        title       = "Enforce SSL connection should be enabled for PostgreSQL database servers"
        description = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
        query       = file("queries/manual.sql")
      }

      check "5" {
        title       = "Function App should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }

      check "6" {
        title       = "Internet-facing virtual machines should be protected with network security groups"
        description = "Protect your virtual machines from potential threats by restricting access to them with network security groups (NSG). Learn more about controlling traffic with NSGs at https://aka.ms/nsg-doc"
        query       = file("queries/manual.sql")
      }

      check "7" {
        title       = "Latest TLS version should be used in your API App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "8" {
        title       = "Latest TLS version should be used in your Function App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "9" {
        title       = "Latest TLS version should be used in your Web App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "10" {
        title       = "Only secure connections to your Azure Cache for Redis should be enabled"
        description = "Audit enabling of only connections via SSL to Azure Cache for Redis. Use of secure connections ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
        query       = file("queries/manual.sql")
      }

      check "11" {
        title       = "Secure transfer to storage accounts should be enabled"
        description = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
        query       = file("queries/manual.sql")
      }

      check "12" {
        title       = "Subnets should be associated with a Network Security Group"
        description = "Protect your subnet from potential threats by restricting access to it with a Network Security Group (NSG). NSGs contain a list of Access Control List (ACL) rules that allow or deny network traffic to your subnet."
        query       = file("queries/manual.sql")
      }

      check "13" {
        title       = "Virtual machines should be connected to an approved virtual network"
        description = "This policy audits any virtual machine connected to a virtual network that is not approved."
        query       = file("queries/manual.sql")
      }

      check "14" {
        title       = "Web Application should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }
    }

    policy "0811_01n2organizational_6_01_n" {
      title = "Exceptions to the traffic flow policy are documented with a supporting mission/business need, duration of the exception, and reviewed at least annually; traffic flow policy exceptions are removed when no longer supported by an explicit mission/business need."

      check "1" {
        title       = "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
        description = "Azure Security Center analyzes the traffic patterns of Internet facing virtual machines and provides Network Security Group rule recommendations that reduce the potential attack surface"
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "API App should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }

      check "3" {
        title       = "Enforce SSL connection should be enabled for MySQL database servers"
        description = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
        query       = file("queries/manual.sql")
      }

      check "4" {
        title       = "Enforce SSL connection should be enabled for PostgreSQL database servers"
        description = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
        query       = file("queries/manual.sql")
      }

      check "5" {
        title       = "Function App should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }

      check "6" {
        title       = "Internet-facing virtual machines should be protected with network security groups"
        description = "Protect your virtual machines from potential threats by restricting access to them with network security groups (NSG). Learn more about controlling traffic with NSGs at https://aka.ms/nsg-doc"
        query       = file("queries/manual.sql")
      }

      check "7" {
        title       = "Latest TLS version should be used in your API App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "8" {
        title       = "Latest TLS version should be used in your Function App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "9" {
        title       = "Latest TLS version should be used in your Web App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "10" {
        title       = "Only secure connections to your Azure Cache for Redis should be enabled"
        description = "Audit enabling of only connections via SSL to Azure Cache for Redis. Use of secure connections ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
        query       = file("queries/manual.sql")
      }

      check "11" {
        title       = "Secure transfer to storage accounts should be enabled"
        description = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
        query       = file("queries/manual.sql")
      }

      check "12" {
        title       = "Subnets should be associated with a Network Security Group"
        description = "Protect your subnet from potential threats by restricting access to it with a Network Security Group (NSG). NSGs contain a list of Access Control List (ACL) rules that allow or deny network traffic to your subnet."
        query       = file("queries/manual.sql")
      }

      check "13" {
        title       = "Virtual machines should be connected to an approved virtual network"
        description = "This policy audits any virtual machine connected to a virtual network that is not approved."
        query       = file("queries/manual.sql")
      }

      check "14" {
        title       = "Web Application should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }
    }

    policy "0812_01n2organizational_8_01_n" {
      title = "Remote devices establishing a non-remote connection are not allowed to communicate with external (remote) resources."

      check "1" {
        title       = "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
        description = "Azure Security Center analyzes the traffic patterns of Internet facing virtual machines and provides Network Security Group rule recommendations that reduce the potential attack surface"
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "API App should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }

      check "3" {
        title       = "Enforce SSL connection should be enabled for MySQL database servers"
        description = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
        query       = file("queries/manual.sql")
      }

      check "4" {
        title       = "Enforce SSL connection should be enabled for PostgreSQL database servers"
        description = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
        query       = file("queries/manual.sql")
      }

      check "5" {
        title       = "Function App should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }

      check "6" {
        title       = "Internet-facing virtual machines should be protected with network security groups"
        description = "Protect your virtual machines from potential threats by restricting access to them with network security groups (NSG). Learn more about controlling traffic with NSGs at https://aka.ms/nsg-doc"
        query       = file("queries/manual.sql")
      }

      check "7" {
        title       = "Latest TLS version should be used in your API App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "8" {
        title       = "Latest TLS version should be used in your Function App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "9" {
        title       = "Latest TLS version should be used in your Web App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "10" {
        title       = "Only secure connections to your Azure Cache for Redis should be enabled"
        description = "Audit enabling of only connections via SSL to Azure Cache for Redis. Use of secure connections ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
        query       = file("queries/manual.sql")
      }

      check "11" {
        title       = "Secure transfer to storage accounts should be enabled"
        description = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
        query       = file("queries/manual.sql")
      }

      check "12" {
        title       = "Subnets should be associated with a Network Security Group"
        description = "Protect your subnet from potential threats by restricting access to it with a Network Security Group (NSG). NSGs contain a list of Access Control List (ACL) rules that allow or deny network traffic to your subnet."
        query       = file("queries/manual.sql")
      }

      check "13" {
        title       = "Virtual machines should be connected to an approved virtual network"
        description = "This policy audits any virtual machine connected to a virtual network that is not approved."
        query       = file("queries/manual.sql")
      }

      check "14" {
        title       = "Web Application should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }
    }

    policy "0814_01n1organizational_12_01_n" {
      title = "The ability of users to connect to the internal network is restricted using a deny-by-default and allow-by-exception policy at managed interfaces according to the access control policy and the requirements of clinical and business applications."

      check "1" {
        title       = "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
        description = "Azure Security Center analyzes the traffic patterns of Internet facing virtual machines and provides Network Security Group rule recommendations that reduce the potential attack surface"
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "API App should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }

      check "3" {
        title       = "Enforce SSL connection should be enabled for MySQL database servers"
        description = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
        query       = file("queries/manual.sql")
      }

      check "4" {
        title       = "Enforce SSL connection should be enabled for PostgreSQL database servers"
        description = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
        query       = file("queries/manual.sql")
      }

      check "5" {
        title       = "Function App should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }

      check "6" {
        title       = "Internet-facing virtual machines should be protected with network security groups"
        description = "Protect your virtual machines from potential threats by restricting access to them with network security groups (NSG). Learn more about controlling traffic with NSGs at https://aka.ms/nsg-doc"
        query       = file("queries/manual.sql")
      }

      check "7" {
        title       = "Latest TLS version should be used in your API App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "8" {
        title       = "Latest TLS version should be used in your Function App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "9" {
        title       = "Latest TLS version should be used in your Web App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "10" {
        title       = "Only secure connections to your Azure Cache for Redis should be enabled"
        description = "Audit enabling of only connections via SSL to Azure Cache for Redis. Use of secure connections ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
        query       = file("queries/manual.sql")
      }

      check "11" {
        title       = "Secure transfer to storage accounts should be enabled"
        description = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
        query       = file("queries/manual.sql")
      }

      check "12" {
        title       = "Subnets should be associated with a Network Security Group"
        description = "Protect your subnet from potential threats by restricting access to it with a Network Security Group (NSG). NSGs contain a list of Access Control List (ACL) rules that allow or deny network traffic to your subnet."
        query       = file("queries/manual.sql")
      }

      check "13" {
        title       = "Virtual machines should be connected to an approved virtual network"
        description = "This policy audits any virtual machine connected to a virtual network that is not approved."
        query       = file("queries/manual.sql")
      }

      check "14" {
        title       = "Web Application should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "user_identification_and_authentication" {
    title = "User Identification and Authentication"

    policy "11109_01q1organizational_57_01_q" {
      title = "The organization ensures that redundant user IDs are not issued to other users and that all users are uniquely identified and authenticated for both local and remote access to information systems."

      check "1" {
        title       = "MFA should be enabled on accounts with owner permissions on your subscription"
        description = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with owner permissions to prevent a breach of accounts or resources."
        query       = file("queries/manual.sql")
      }
    }

    policy "11110_01q1organizational_6_01_q" {
      title = "Non-organizational users (all information system users other than organizational users, such as patients, customers, contractors, or foreign nationals), or processes acting on behalf of non-organizational users, determined to need access to information residing on the organization's information systems, are uniquely identified and authenticated."

      check "1" {
        title       = "MFA should be enabled accounts with write permissions on your subscription"
        description = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with write privileges to prevent a breach of accounts or resources."
        query       = file("queries/manual.sql")
      }
    }

    policy "11111_01q2system_4_01_q" {
      title = "When PKI-based authentication is used, the information system validates certificates by constructing and verifying a certification path to an accepted trust anchor, including checking certificate status information; enforces access to the corresponding private key; maps the identity to the corresponding account of the individual or group; and implements a local cache of revocation data to support path discovery and validation in case of an inability to access revocation information via the network."

      check "1" {
        title       = "MFA should be enabled on accounts with read permissions on your subscription"
        description = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with read privileges to prevent a breach of accounts or resources."
        query       = file("queries/manual.sql")
      }
    }

    policy "11112_01q2organizational_67_01_q" {
      title = "The information system employs replay-resistant authentication mechanisms such as nonce, one-time passwords, or time stamps to secure network access for privileged accounts; and, for hardware token-based authentication, employs mechanisms that satisfy minimum token requirements discussed in NIST SP 800-63-2, Electronic Authentication Guideline."

      check "1" {
        title       = "A maximum of 3 owners should be designated for your subscription"
        description = "It is recommended to designate up to 3 subscription owners in order to reduce the potential for breach by a compromised owner."
        query       = file("queries/manual.sql")
      }
    }

    policy "11208_01q1organizational_8_01_q" {
      title = "The organization requires that electronic signatures, unique to one individual, cannot be reused by, or reassigned to, anyone else."

      check "1" {
        title       = "There should be more than one owner assigned to your subscription"
        description = "It is recommended to designate more than one subscription owner in order to have administrator access redundancy."
        query       = file("queries/manual.sql")
      }
    }

    policy "11210_01q2organizational_10_01_q" {
      title = "Electronic signatures and handwritten signatures executed to electronic records shall be linked to their respective electronic records."

      check "1" {
        title       = "Audit Windows machines that have the specified members in the Administrators group"
        description = "Requires that prerequisites are deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol. Machines are non-compliant if the local Administrators group contains one or more of the members listed in the policy parameter."
        query       = file("queries/manual.sql")
      }
    }

    policy "11211_01q2organizational_11_01_q" {
      title = "Signed electronic records shall contain information associated with the signing in human-readable format."

      check "1" {
        title       = "Audit Windows machines missing any of specified members in the Administrators group"
        description = "Requires that prerequisites are deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol. Machines are non-compliant if the local Administrators group does not contain one or more members that are listed in the policy parameter."
        query       = file("queries/manual.sql")
      }
    }

    policy "1123_01q1system_2_01_q" {
      title = "Users who performed privileged functions (e.g., system administration) use separate accounts when performing those privileged functions."

      check "1" {
        title       = "Audit Windows machines that have extra accounts in the Administrators group"
        description = "Requires that prerequisites are deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol. Machines are non-compliant if the local Administrators group contains members that are not listed in the policy parameter."
        query       = file("queries/manual.sql")
      }
    }

    policy "1125_01q2system_1_01_q" {
      title = "Multi-factor authentication methods are used in accordance with organizational policy, (e.g., for remote network access)."

      check "1" {
        title       = "Audit Windows machines that have the specified members in the Administrators group"
        description = "Requires that prerequisites are deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol. Machines are non-compliant if the local Administrators group contains one or more of the members listed in the policy parameter."
        query       = file("queries/manual.sql")
      }
    }

    policy "1127_01q2system_3_01_q" {
      title = "Where tokens are provided for multi-factor authentication, in-person verification is required prior to granting access."

      check "1" {
        title       = "Audit Windows machines missing any of specified members in the Administrators group"
        description = "Requires that prerequisites are deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol. Machines are non-compliant if the local Administrators group does not contain one or more members that are listed in the policy parameter."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "identification_of_risks_related_to_external_parties" {
    title = "Identification of Risks Related to External Parties"

    policy "1401_05i1organizational_1239_05_i" {
      title = "Access to the organizations information and systems by external parties is not permitted until due diligence has been conducted, the appropriate controls have been implemented, and a contract/agreement reflecting the security requirements is signed acknowledging they understand and accept their obligations."

      check "1" {
        title       = "Secure transfer to storage accounts should be enabled"
        description = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
        query       = file("queries/manual.sql")
      }
    }

    policy "1402_05i1organizational_45_05_i" {
      title = "Remote access connections between the organization and external parties are encrypted."

      check "1" {
        title       = "Function App should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }
    }

    policy "1403_05i1organizational_67_05_i" {
      title = "Access granted to external parties is limited to the minimum necessary and granted only for the duration required."

      check "1" {
        title       = "Web Application should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }
    }

    policy "1404_05i2organizational_1_05_i" {
      title = "Due diligence of the external party includes interviews, document review, checklists, certification reviews (e.g. HITRUST) or other remote means."

      check "1" {
        title       = "API App should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }
    }

    policy "1418_05i1organizational_8_05_i" {
      title = "The identification of risks related to external party access takes into account a minimal set of specifically defined issues."

      check "1" {
        title       = "Enforce SSL connection should be enabled for MySQL database servers"
        description = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
        query       = file("queries/manual.sql")
      }
    }

    policy "1450_05i2organizational_2_05_i" {
      title = "The organization obtains satisfactory assurances that reasonable information security exists across their information supply chain by performing an annual review, which includes all partners/third party-providers upon which their information supply chain depends."

      check "1" {
        title       = "Enforce SSL connection should be enabled for PostgreSQL database servers"
        description = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
        query       = file("queries/manual.sql")
      }
    }

    policy "1451_05icsporganizational_2_05_i" {
      title = "Cloud service providers design and implement controls to mitigate and contain data security risks through proper separation of duties, role-based access, and least-privilege access for all personnel within their supply chain."

      check "1" {
        title       = "Only secure connections to your Azure Cache for Redis should be enabled"
        description = "Audit enabling of only connections via SSL to Azure Cache for Redis. Use of secure connections ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "audit_logging" {
    title = "Audit Logging"

    policy "1202_09aa1system_1_09_aa" {
      title = "A secure audit record is created for all activities on the system (create, read, update, delete) involving covered information."

      check "1" {
        title       = "Resource logs in Azure Data Lake Store should be enabled"
        description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised"
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "System updates on virtual machine scale sets should be installed"
        description = "Audit whether there are any missing system security updates and critical updates that should be installed to ensure that your Windows and Linux virtual machine scale sets are secure."
        query       = file("queries/manual.sql")
      }
    }

    policy "1203_09aa1system_2_09_aa" {
      title = "Audit records include the unique user ID, unique data subject ID, function performed, and date/time the event was performed."

      check "1" {
        title       = "Resource logs in Logic Apps should be enabled"
        description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised"
        query       = file("queries/manual.sql")
      }
    }

    policy "1204_09aa1system_3_09_aa" {
      title = "The activities of privileged users (administrators, operators, etc.) include the success/failure of the event, time the event occurred, the account involved, the processes involved, and additional information about the event."

      check "1" {
        title       = "Resource logs in IoT Hub should be enabled"
        description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised"
        query       = file("queries/manual.sql")
      }
    }

    policy "1205_09aa2system_1_09_aa" {
      title = "Logs of messages sent and received are maintained including the date, time, origin and destination of the message, but not its contents."

      check "1" {
        title       = "Resource logs in Batch accounts should be enabled"
        description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised"
        query       = file("queries/manual.sql")
      }
    }

    policy "1206_09aa2system_23_09_aa" {
      title = "Auditing is always available while the system is active and tracks key events, success/failed data access, system security configuration changes, privileged or utility use, any alarms raised,  activation and de-activation of protection systems (e.g., A/V and IDS), activation and deactivation of identification and authentication mechanisms, and creation and deletion of system-level objects."

      check "1" {
        title       = "Resource logs in Virtual Machine Scale Sets should be enabled"
        description = "It is recommended to enable Logs so that activity trail can be recreated when investigations are required in the event of an incident or a compromise."
        query       = file("queries/manual.sql")
      }
    }

    policy "1207_09aa2system_4_09_aa" {
      title = "Audit records are retained for 90 days and older audit records are archived for one year."

      check "1" {
        title       = "Resource logs in Azure Stream Analytics should be enabled"
        description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised"
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "Resource logs in Event Hub should be enabled"
        description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised"
        query       = file("queries/manual.sql")
      }
    }

    policy "1208_09aa3system_1_09_aa" {
      title = "Audit logs are maintained for management activities, system and application startup/shutdown/errors, file changes, and security policy changes."

      check "1" {
        title       = "Resource logs in Search services should be enabled"
        description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised"
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "Resource logs in Service Bus should be enabled"
        description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised"
        query       = file("queries/manual.sql")
      }
    }

    policy "1209_09aa3system_2_09_aa" {
      title = "The information system generates audit records containing the following detailed information: (i) filename accessed; (ii) program or command used to initiate the event; and (iii) source and destination addresses."

      check "1" {
        title       = "Resource logs in App Services should be enabled"
        description = "Audit enabling of resource logs on the app. This enables you to recreate activity trails for investigation purposes if a security incident occurs or your network is compromised."
        query       = file("queries/manual.sql")
      }
    }

    policy "1210_09aa3system_3_09_aa" {
      title = "All disclosures of covered information within or outside of the organization are logged including type of disclosure, date/time of the event, recipient, and sender."

      check "1" {
        title       = "Audit diagnostic setting"
        description = "Audit diagnostic setting for selected resource types"
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "Resource logs in Data Lake Analytics should be enabled"
        description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised"
        query       = file("queries/manual.sql")
      }
    }

    policy "1211_09aa3system_4_09_aa" {
      title = "The organization verifies every ninety (90) days for each extract of covered information recorded that the data is erased or its use is still required."

      check "1" {
        title       = "Auditing on SQL server should be enabled"
        description = "Auditing on your SQL Server should be enabled to track database activities across all databases on the server and save them in an audit log."
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "Resource logs in Azure Key Vault Managed HSM should be enabled"
        description = "To recreate activity trails for investigation purposes when a security incident occurs or when your network is compromised, you may want to audit by enabling resource logs on Managed HSMs. Please follow the instructions here: https://docs.microsoft.com/azure/key-vault/managed-hsm/logging."
        query       = file("queries/manual.sql")
      }

      check "3" {
        title       = "Resource logs in Key Vault should be enabled"
        description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes when a security incident occurs or when your network is compromised"
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "monitoring_system_use" {
    title = "Monitoring System Use"

    policy "1120_09ab3system_9_09_ab" {
      title = "Unauthorized remote connections to the information systems are monitored and reviewed at least quarterly, and appropriate action is taken if an unauthorized connection is discovered."

      check "1" {
        title       = "Azure Monitor should collect activity logs from all regions"
        description = "This policy audits the Azure Monitor log profile which does not export activities from all Azure supported regions including global."
        query       = file("queries/manual.sql")
      }
    }

    policy "12100_09ab2system_15_09_ab" {
      title = "The organization monitors the information system to identify irregularities or anomalies that are indicators of a system malfunction or compromise and help confirm the system is functioning in an optimal, resilient and secure state."

      check "1" {
        title       = "Virtual machines should have the Log Analytics extension installed"
        description = "This policy audits any Windows/Linux virtual machines if the Log Analytics extension is not installed."
        query       = file("queries/manual.sql")
      }
    }

    policy "12101_09ab1organizational_3_09_ab" {
      title = "The organization specifies how often audit logs are reviewed, how the reviews are documented, and the specific roles and responsibilities of the personnel conducting the reviews, including the professional certifications or other qualifications required."

      check "1" {
        title       = "The Log Analytics extension should be installed on Virtual Machine Scale Sets"
        description = "This policy audits any Windows/Linux Virtual Machine Scale Sets if the Log Analytics extension is not installed."
        query       = file("queries/manual.sql")
      }
    }

    policy "12102_09ab1organizational_4_09_ab" {
      title = "The organization shall periodically test its monitoring and detection processes, remediate deficiencies, and improve its processes."

      check "1" {
        title       = "Audit Windows machines on which the Log Analytics agent is not connected as expected"
        description = "Requires that prerequisites are deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol. Machines are non-compliant if the agent is not installed, or if it is installed but the COM object AgentConfigManager.MgmtSvcCfg returns that it is registered to a workspace other than the ID specified in the policy parameter."
        query       = file("queries/manual.sql")
      }
    }

    policy "1212_09ab1system_1_09_ab" {
      title = "All applicable legal requirements related to monitoring authorized access and unauthorized access attempts are met."

      check "1" {
        title       = "Azure Monitor log profile should collect logs for categories 'write,' 'delete,' and 'action'"
        description = "This policy ensures that a log profile collects logs for categories 'write,' 'delete,' and 'action'"
        query       = file("queries/manual.sql")
      }
    }

    policy "1213_09ab2system_128_09_ab" {
      title = "Automated systems deployed throughout the organization's environment are used to monitor key events and anomalous activity, and analyze system logs, the results of which are reviewed regularly."

      check "1" {
        title       = "Auto provisioning of the Log Analytics agent should be enabled on your subscription"
        description = "To monitor for security vulnerabilities and threats, Azure Security Center collects data from your Azure virtual machines. Data is collected by the Log Analytics agent, formerly known as the Microsoft Monitoring Agent (MMA), which reads various security-related configurations and event logs from the machine and copies the data to your Log Analytics workspace for analysis. We recommend enabling auto provisioning to automatically deploy the agent to all supported Azure VMs and any new ones that are created."
        query       = file("queries/manual.sql")
      }
    }

    policy "1214_09ab2system_3456_09_ab" {
      title = "Monitoring includes privileged operations, authorized access or unauthorized access attempts, including attempts to access deactivated accounts, and system alerts or failures."

      check "1" {
        title       = "Azure Monitor should collect activity logs from all regions"
        description = "This policy audits the Azure Monitor log profile which does not export activities from all Azure supported regions including global."
        query       = file("queries/manual.sql")
      }
    }

    policy "1215_09ab2system_7_09_ab" {
      title = "Auditing and monitoring systems employed by the organization support audit reduction and report generation."

      check "1" {
        title       = "Virtual machines should have the Log Analytics extension installed"
        description = "This policy audits any Windows/Linux virtual machines if the Log Analytics extension is not installed."
        query       = file("queries/manual.sql")
      }
    }

    policy "1216_09ab3system_12_09_ab" {
      title = "Automated systems are used to review monitoring activities of security systems (e.g., IPS/IDS) and system records on a daily basis, and identify and document anomalies."

      check "1" {
        title       = "The Log Analytics extension should be installed on Virtual Machine Scale Sets"
        description = "This policy audits any Windows/Linux Virtual Machine Scale Sets if the Log Analytics extension is not installed."
        query       = file("queries/manual.sql")
      }
    }

    policy "1217_09ab3system_3_09_ab" {
      title = "Alerts are generated for technical personnel to analyze and investigate suspicious activity or suspected violations."

      check "1" {
        title       = "Audit Windows machines on which the Log Analytics agent is not connected as expected"
        description = "Requires that prerequisites are deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol. Machines are non-compliant if the agent is not installed, or if it is installed but the COM object AgentConfigManager.MgmtSvcCfg returns that it is registered to a workspace other than the ID specified in the policy parameter."
        query       = file("queries/manual.sql")
      }
    }

    policy "1219_09ab3system_10_09_ab" {
      title = "The information system is able to automatically process audit records for events of interest based on selectable criteria."

      check "1" {
        title       = "Azure Monitor log profile should collect logs for categories 'write,' 'delete,' and 'action'"
        description = "This policy ensures that a log profile collects logs for categories 'write,' 'delete,' and 'action'"
        query       = file("queries/manual.sql")
      }
    }

    policy "1220_09ab3system_56_09_ab" {
      title = "Monitoring includes inbound and outbound communications and file integrity monitoring."

      check "1" {
        title       = "Auto provisioning of the Log Analytics agent should be enabled on your subscription"
        description = "To monitor for security vulnerabilities and threats, Azure Security Center collects data from your Azure virtual machines. Data is collected by the Log Analytics agent, formerly known as the Microsoft Monitoring Agent (MMA), which reads various security-related configurations and event logs from the machine and copies the data to your Log Analytics workspace for analysis. We recommend enabling auto provisioning to automatically deploy the agent to all supported Azure VMs and any new ones that are created."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "administrator_and_operator_logs" {
    title = "Administrator and Operator Logs"

    policy "1270_09ad1system_12_09_ad" {
      title = "The organization ensures proper logging is enabled in order to audit administrator activities; and reviews system administrator and operator logs on a regular basis."

      check "1" {
        title       = "An activity log alert should exist for specific Administrative operations"
        description = "This policy audits specific Administrative operations with no activity log alerts configured."
        query       = file("queries/manual.sql")
      }
    }

    policy "1271_09ad1system_1_09_ad" {
      title = "An intrusion detection system managed outside of the control of system and network administrators is used to monitor system and network administration activities for compliance."

      check "1" {
        title       = "An activity log alert should exist for specific Administrative operations"
        description = "This policy audits specific Administrative operations with no activity log alerts configured."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "segregation_of_duties" {
    title = "Segregation of Duties"

    policy "1229_09c1organizational_1_09_c" {
      title = "Separation of duties is used to limit the risk of unauthorized or unintentional modification of information and systems."

      check "1" {
        title       = "Role-Based Access Control (RBAC) should be used on Kubernetes Services"
        description = "To provide granular filtering on the actions that users can perform, use Role-Based Access Control (RBAC) to manage permissions in Kubernetes Service Clusters and configure relevant authorization policies."
        query       = file("queries/manual.sql")
      }
    }

    policy "1230_09c2organizational_1_09_c" {
      title = "No single person is able to access, modify, or use information systems without authorization or detection."

      check "1" {
        title       = "Audit usage of custom RBAC rules"
        description = "Audit built-in roles such as 'Owner, Contributer, Reader' instead of custom RBAC roles, which are error prone. Using custom roles is treated as an exception and requires a rigorous review and threat modeling"
        query       = file("queries/manual.sql")
      }
    }

    policy "1232_09c3organizational_12_09_c" {
      title = "Access for individuals responsible for administering  access controls is limited to the minimum necessary based upon each user's role and responsibilities and these individuals cannot access audit functions related to these controls."

      check "1" {
        title       = "Windows machines should meet requirements for 'User Rights Assignment'"
        description = "Windows machines should have the specified Group Policy settings in the category 'User Rights Assignment' for allowing log on locally, RDP, access from the network, and many other user activities. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }

    policy "1277_09c2organizational_4_09_c" {
      title = "The initiation of an event is separated from its authorization to reduce the possibility of collusion."

      check "1" {
        title       = "Windows machines should meet requirements for 'Security Options_User Account Control'"
        description = "Windows machines should have the specified Group Policy settings in the category 'Security Options_User Account Control' for mode for admins, behavior of elevation prompt, and virtualizing file and registry write failures. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "controls_against_malicious_code" {
    title = "Controls Against Malicious Code"

    policy "0201_09j1organizational_124_09_j" {
      title = "Anti-virus and anti-spyware are installed, operating and updated on all end-user devices to conduct periodic scans of the systems to identify and remove unauthorized software. Server environments for which the server software developer specifically recommends not installing host-based anti-virus and anti-spyware software may address the requirement via a network-based malware detection (NBMD) solution."

      check "1" {
        title       = "Adaptive application controls for defining safe applications should be enabled on your machines"
        description = "Enable application controls to define the list of known-safe applications running on your machines, and alert you when other applications run. This helps harden your machines against malware. To simplify the process of configuring and maintaining your rules, Security Center uses machine learning to analyze the applications running on each machine and suggest the list of known-safe applications."
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "Deploy default Microsoft IaaSAntimalware extension for Windows Server"
        description = "This policy deploys a Microsoft IaaSAntimalware extension with a default configuration when a VM is not configured with the antimalware extension."
        query       = file("queries/manual.sql")
      }

      check "3" {
        title       = "Endpoint protection solution should be installed on virtual machine scale sets"
        description = "Audit the existence and health of an endpoint protection solution on your virtual machines scale sets, to protect them from threats and vulnerabilities."
        query       = file("queries/manual.sql")
      }

      check "4" {
        title       = "Microsoft Antimalware for Azure should be configured to automatically update protection signatures"
        description = "This policy audits any Windows virtual machine not configured with automatic update of Microsoft Antimalware protection signatures."
        query       = file("queries/manual.sql")
      }

      check "5" {
        title       = "Monitor missing Endpoint Protection in Azure Security Center"
        description = "Servers without an installed Endpoint Protection agent will be monitored by Azure Security Center as recommendations"
        query       = file("queries/manual.sql")
      }

      check "6" {
        title       = "System updates should be installed on your machines"
        description = "Missing security system updates on your servers will be monitored by Azure Security Center as recommendations"
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "back_up" {
    title = "Back-up"

    policy "1616_09l1organizational_16_09_l" {
      title = "Backup copies of information and software are made and tests of the media and restoration procedures are regularly performed at appropriate intervals."

      check "1" {
        title       = "Long-term geo-redundant backup should be enabled for Azure SQL Databases"
        description = "This policy audits any Azure SQL Database with long-term geo-redundant backup not enabled."
        query       = file("queries/manual.sql")
      }
    }

    policy "1617_09l1organizational_23_09_l" {
      title = "A formal definition of the level of backup required for each system is defined and documented including how each system will be restored, the scope of data to be imaged, frequency of imaging, and duration of retention based on relevant contractual, legal, regulatory and business requirements."

      check "1" {
        title       = "Geo-redundant backup should be enabled for Azure Database for MySQL"
        description = "Azure Database for MySQL allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
        query       = file("queries/manual.sql")
      }
    }

    policy "1618_09l1organizational_45_09_l" {
      title = "The backups are stored in a physically secure remote location, at a sufficient distance to make them reasonably immune from damage to data at the primary site, and reasonable physical and environmental controls are in place to ensure their protection at the remote location."

      check "1" {
        title       = "Geo-redundant backup should be enabled for Azure Database for PostgreSQL"
        description = "Azure Database for PostgreSQL allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
        query       = file("queries/manual.sql")
      }
    }

    policy "1619_09l1organizational_7_09_l" {
      title = "Inventory records for the backup copies, including content and current location, are maintained."

      check "1" {
        title       = "Geo-redundant backup should be enabled for Azure Database for MariaDB"
        description = "Azure Database for MariaDB allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
        query       = file("queries/manual.sql")
      }
    }

    policy "1620_09l1organizational_8_09_l" {
      title = "When the backup service is delivered by the third party, the service level agreement includes the detailed protections to control confidentiality, integrity and availability of the backup information."

      check "1" {
        title       = "Azure Backup should be enabled for Virtual Machines"
        description = "Ensure protection of your Azure Virtual Machines by enabling Azure Backup. Azure Backup is a secure and cost effective data protection solution for Azure."
        query       = file("queries/manual.sql")
      }
    }

    policy "1621_09l2organizational_1_09_l" {
      title = "Automated tools are used to track all backups."

      check "1" {
        title       = "Long-term geo-redundant backup should be enabled for Azure SQL Databases"
        description = "This policy audits any Azure SQL Database with long-term geo-redundant backup not enabled."
        query       = file("queries/manual.sql")
      }
    }

    policy "1622_09l2organizational_23_09_l" {
      title = "The integrity and security of the backup copies are maintained to ensure future availability, and any potential accessibility problems with the backup copies are identified and mitigated in the event of an area-wide disaster."

      check "1" {
        title       = "Geo-redundant backup should be enabled for Azure Database for MySQL"
        description = "Azure Database for MySQL allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
        query       = file("queries/manual.sql")
      }
    }

    policy "1623_09l2organizational_4_09_l" {
      title = "Covered information is backed-up in an encrypted format to ensure confidentiality."

      check "1" {
        title       = "Geo-redundant backup should be enabled for Azure Database for PostgreSQL"
        description = "Azure Database for PostgreSQL allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
        query       = file("queries/manual.sql")
      }
    }

    policy "1624_09l3organizational_12_09_l" {
      title = "The organization performs incremental or differential backups daily and full backups weekly to separate media."

      check "1" {
        title       = "Geo-redundant backup should be enabled for Azure Database for MariaDB"
        description = "Azure Database for MariaDB allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
        query       = file("queries/manual.sql")
      }
    }

    policy "1625.09l3Organizational.34_09.l" {
      title = "Three (3) generations of backups (full plus all related incremental or differential backups) are stored off-site, and both on-site and off-site backups are logged with name, date, time and action."

      check "1" {
        title       = "Azure Backup should be enabled for Virtual Machines"
        description = "Ensure protection of your Azure Virtual Machines by enabling Azure Backup. Azure Backup is a secure and cost effective data protection solution for Azure."
        query       = file("queries/manual.sql")
      }
    }

    policy "1626_09l3organizational_5_09_l" {
      title = "The organization ensures a current, retrievable copy of covered information is available before movement of servers."

      check "1" {
        title       = "Geo-redundant backup should be enabled for Azure Database for PostgreSQL"
        description = "Azure Database for PostgreSQL allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
        query       = file("queries/manual.sql")
      }
    }

    policy "1627_09l3organizational_6_09_l" {
      title = "The organization tests backup information following each backup to verify media reliability and information integrity, and at least annually thereafter."

      check "1" {
        title       = "Geo-redundant backup should be enabled for Azure Database for MariaDB"
        description = "Azure Database for MariaDB allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
        query       = file("queries/manual.sql")
      }
    }

    policy "1699_09l1organizational_10_09_l" {
      title = "Workforce members roles and responsibilities in the data backup process are identified and communicated to the workforce; in particular, Bring Your Own Device (BYOD) users are required to perform backups of organizational and/or client data on their devices."

      check "1" {
        title       = "Azure Backup should be enabled for Virtual Machines"
        description = "Ensure protection of your Azure Virtual Machines by enabling Azure Backup. Azure Backup is a secure and cost effective data protection solution for Azure."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "network_controls" {
    title = "Network Controls"

    policy "0858_09m1organizational_4_09_m" {
      title = "The organization monitors for all authorized and unauthorized wireless access to the information system and prohibits installation of wireless access points (WAPs) unless explicitly authorized in writing by the CIO or his/her designated representative."

      check "1" {
        title       = "All network ports should be restricted on network security groups associated to your virtual machine"
        description = "Azure Security Center has identified some of your network security groups' inbound rules to be too permissive. Inbound rules should not allow access from 'Any' or 'Internet' ranges. This can potentially enable attackers to target your resources."
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "Management ports of virtual machines should be protected with just-in-time network access control"
        description = "Possible network Just In Time (JIT) access will be monitored by Azure Security Center as recommendations"
        query       = file("queries/manual.sql")
      }

      check "3" {
        title       = "Windows machines should meet requirements for 'Windows Firewall Properties'"
        description = "Windows machines should have the specified Group Policy settings in the category 'Windows Firewall Properties' for firewall state, connections, rule management, and notifications. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }

    policy "0859_09m1organizational_78_09_m" {
      title = "The organization ensures the security of information in networks, availability of network services and information services using the network, and the protection of connected services from unauthorized access."

      check "1" {
        title       = "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
        description = "Azure Security Center analyzes the traffic patterns of Internet facing virtual machines and provides Network Security Group rule recommendations that reduce the potential attack surface"
        query       = file("queries/manual.sql")
      }
    }

    policy "0860_09m1organizational_9_09_m" {
      title = "The organization formally manages equipment on the network, including equipment in user areas."

      check "1" {
        title       = "Deploy Diagnostic Settings for Network Security Groups"
        description = "This policy automatically deploys diagnostic settings to network security groups. A storage account with name '{storagePrefixParameter}{NSGLocation}' will be automatically created."
        query       = file("queries/manual.sql")
      }
    }

    policy "0861_09m2organizational_67_09_m" {
      title = "To identify and authenticate devices on local and/or wide area networks, including wireless networks,  the information system uses either a (i) shared known information solution or (ii) an organizational authentication solution, the exact selection and strength of which is dependent on the security categorization of the information system."

      check "1" {
        title       = "App Service should use a virtual network service endpoint"
        description = "This policy audits any App Service not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "Windows machines should meet requirements for 'Security Options_Network Access'"
        description = "Windows machines should have the specified Group Policy settings in the category 'Security Options_Network Access' for including access for anonymous users, local accounts, and remote access to the registry. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }

    policy "0862_09m2organizational_8_09_m" {
      title = "The organization ensures information systems protect the confidentiality and integrity of transmitted information, including during preparation for transmission and during reception."

      check "1" {
        title       = "SQL Server should use a virtual network service endpoint"
        description = "This policy audits any SQL Server not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }
    }

    policy "0863_09m2organizational_910_09_m" {
      title = "The organization builds a firewall configuration that restricts connections between un-trusted networks and any system components in the covered information environment; and any changes to the firewall configuration are updated in the network diagram."

      check "1" {
        title       = "Event Hub should use a virtual network service endpoint"
        description = "This policy audits any Event Hub not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }
    }

    policy "0864_09m2organizational_12_09_m" {
      title = "Usage restrictions and implementation guidance are formally defined for VoIP, including the authorization and monitoring of the service."

      check "1" {
        title       = "Cosmos DB should use a virtual network service endpoint"
        description = "This policy audits any Cosmos DB not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }
    }

    policy "0865_09m2organizational_13_09_m" {
      title = "The organization (i) authorizes connections from the information system to other information systems outside of the organization through the use of interconnection security agreements or other formal agreement; (ii) documents each connection, the interface characteristics, security requirements, and the nature of the information communicated; (iii) employs a deny all, permit by exception policy for allowing connections from the information system to other information systems outside of the organization; and (iv) applies a default-deny rule that drops all traffic via host-based firewalls or port filtering tools on its endpoints (workstations, servers, etc.), except those services and ports that are explicitly allowed."

      check "1" {
        title       = "Key Vault should use a virtual network service endpoint"
        description = "This policy audits any Key Vault not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }
    }

    policy "0866_09m3organizational_1516_09_m" {
      title = "The organization describes the groups, roles, and responsibilities for the logical management of network components and ensures coordination of and consistency in the elements of the network infrastructure."

      check "1" {
        title       = "Storage accounts should restrict network access"
        description = "Network access to storage accounts should be restricted. Configure network rules so only applications from allowed networks can access the storage account. To allow connections from specific internet or on-premises clients, access can be granted to traffic from specific Azure virtual networks or to public internet IP address ranges"
        query       = file("queries/manual.sql")
      }
    }

    policy "0867_09m3organizational_17_09_m" {
      title = "Wireless access points are placed in secure areas and shut down when not in use (e.g. nights, weekends)."

      check "1" {
        title       = "Storage Accounts should use a virtual network service endpoint"
        description = "This policy audits any Storage Account not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }
    }

    policy "0868_09m3organizational_18_09_m" {
      title = "The organization builds a firewall configuration to restrict inbound and outbound traffic to that which is necessary for the covered data environment."

      check "1" {
        title       = "[Preview]: Container Registry should use a virtual network service endpoint"
        description = "This policy audits any Container Registry not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }
    }

    policy "0869_09m3organizational_19_09_m" {
      title = "The router configuration files are secured and synchronized."

      check "1" {
        title       = "[Preview]: Container Registry should use a virtual network service endpoint"
        description = "This policy audits any Container Registry not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }
    }

    policy "0870_09m3organizational_20_09_m" {
      title = "Access to all proxies is denied, except for those hosts, ports, and services that are explicitly required."

      check "1" {
        title       = "[Preview]: Container Registry should use a virtual network service endpoint"
        description = "This policy audits any Container Registry not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }
    }

    policy "0871_09m3organizational_22_09_m" {
      title = "Authoritative DNS servers are segregated into internal and external roles."

      check "1" {
        title       = "[Preview]: Container Registry should use a virtual network service endpoint"
        description = "This policy audits any Container Registry not configured to use a virtual network service endpoint."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "security_of_network_services" {
    title = "Security of Network Services"

    policy "0835_09n1organizational_1_09_n" {
      title = "Agreed services provided by a network service provider/manager are formally managed and monitored to ensure they are provided securely."

      check "1" {
        title       = "[Preview]: Network traffic data collection agent should be installed on Windows virtual machines"
        description = "Security Center uses the Microsoft Dependency agent to collect network traffic data from your Azure virtual machines to enable advanced network protection features such as traffic visualization on the network map, network hardening recommendations and specific network threats."
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "Virtual machines should be migrated to new Azure Resource Manager resources"
        description = "Use new Azure Resource Manager for your virtual machines to provide security enhancements such as: stronger access control (RBAC), better auditing, Azure Resource Manager based deployment and governance, access to managed identities, access to key vault for secrets, Azure AD-based authentication and support for tags and resource groups for easier security management"
        query       = file("queries/manual.sql")
      }
    }

    policy "0836_09_n2organizational_1_09_n" {
      title = "The organization formally authorizes and documents the characteristics of each connection from an information system to other information systems outside the organization."

      check "1" {
        title       = "[Preview]: Network traffic data collection agent should be installed on Linux virtual machines"
        description = "Security Center uses the Microsoft Dependency agent to collect network traffic data from your Azure virtual machines to enable advanced network protection features such as traffic visualization on the network map, network hardening recommendations and specific network threats."
        query       = file("queries/manual.sql")
      }
    }

    policy "0837_09_n2organizational_2_09_n" {
      title = "Formal agreements with external information system providers include specific obligations for security and privacy."

      check "1" {
        title       = "Network Watcher should be enabled"
        description = "Network Watcher is a regional service that enables you to monitor and diagnose conditions at a network scenario level in, to, and from Azure. Scenario level monitoring enables you to diagnose problems at an end to end network level view. It is required to have a network watcher resource group to be created in every region where a virtual network is present. An alert is enabled if a network watcher resource group is not available in a particular region."
        query       = file("queries/manual.sql")
      }
    }

    policy "0885_09n2organizational_3_09_n" {
      title = "The organization reviews and updates the interconnection security agreements on an ongoing basis verifying enforcement of security requirements."

      check "1" {
        title       = "[Preview]: Network traffic data collection agent should be installed on Linux virtual machines"
        description = "Security Center uses the Microsoft Dependency agent to collect network traffic data from your Azure virtual machines to enable advanced network protection features such as traffic visualization on the network map, network hardening recommendations and specific network threats."
        query       = file("queries/manual.sql")
      }
    }

    policy "0886_09n2organizational_4_09_n" {
      title = "The organization employs and documents in a formal agreement or other document, either i) allow-all, deny-by-exception, or, ii) deny-all, permit-by-exception (preferred), policy for allowing specific information systems to connect to external information systems."

      check "1" {
        title       = "Network Watcher should be enabled"
        description = "Network Watcher is a regional service that enables you to monitor and diagnose conditions at a network scenario level in, to, and from Azure. Scenario level monitoring enables you to diagnose problems at an end to end network level view. It is required to have a network watcher resource group to be created in every region where a virtual network is present. An alert is enabled if a network watcher resource group is not available in a particular region."
        query       = file("queries/manual.sql")
      }
    }

    policy "0887_09n2organizational_5_09_n" {
      title = "The organization requires external/outsourced service providers to identify the specific functions, ports, and protocols used in the provision of the external/outsourced services."

      check "1" {
        title       = "[Preview]: Network traffic data collection agent should be installed on Windows virtual machines"
        description = "Security Center uses the Microsoft Dependency agent to collect network traffic data from your Azure virtual machines to enable advanced network protection features such as traffic visualization on the network map, network hardening recommendations and specific network threats."
        query       = file("queries/manual.sql")
      }
    }

    policy "0888_09n2organizational_6_09_n" {
      title = "The contract with the external/outsourced service provider includes the specification that the service provider is responsible for the protection of covered information shared."

      check "1" {
        title       = "Network Watcher should be enabled"
        description = "Network Watcher is a regional service that enables you to monitor and diagnose conditions at a network scenario level in, to, and from Azure. Scenario level monitoring enables you to diagnose problems at an end to end network level view. It is required to have a network watcher resource group to be created in every region where a virtual network is present. An alert is enabled if a network watcher resource group is not available in a particular region."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "management_of_removable_media" {
    title = "Management of Removable Media"

    policy "0301_09o1organizational_123_09_o" {
      title = "The organization, based on the data classification level, registers media (including laptops) prior to use, places reasonable restrictions on how such media be used, and provides an appropriate level of physical and logical protection (including encryption) for media containing covered information until properly destroyed or sanitized."

      check "1" {
        title       = "Transparent Data Encryption on SQL databases should be enabled"
        description = "Transparent data encryption should be enabled to protect data-at-rest and meet compliance requirements"
        query       = file("queries/manual.sql")
      }
    }

    policy "0302_09o2organizational_1_09_o" {
      title = "The organization protects and controls media containing sensitive information during transport outside of controlled areas."

      check "1" {
        title       = "Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources"
        description = "By default, a virtual machine's OS and data disks are encrypted-at-rest using platform-managed keys. Temp disks, data caches and data flowing between compute and storage aren't encrypted. Disregard this recommendation if: 1. using encryption-at-host, or 2. server-side encryption on Managed Disks meets your security requirements. Learn more in: Server-side encryption of Azure Disk Storage: https://aka.ms/disksse, Different disk encryption offerings: https://aka.ms/diskencryptioncomparison"
        query       = file("queries/manual.sql")
      }
    }

    policy "0304_09o3organizational_1_09_o" {
      title = "The organization restricts the use of writable removable media and personally-owned removable media in organizational systems."

      check "1" {
        title       = "Require encryption on Data Lake Store accounts"
        description = "This policy ensures encryption is enabled on all Data Lake Store accounts"
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "SQL managed instances should use customer-managed keys to encrypt data at rest"
        description = "Implementing Transparent Data Encryption (TDE) with your own key provides you with increased transparency and control over the TDE Protector, increased security with an HSM-backed external service, and promotion of separation of duties. This recommendation applies to organizations with a related compliance requirement."
        query       = file("queries/manual.sql")
      }

      check "3" {
        title       = "SQL servers should use customer-managed keys to encrypt data at rest"
        description = "Implementing Transparent Data Encryption (TDE) with your own key provides increased transparency and control over the TDE Protector, increased security with an HSM-backed external service, and promotion of separation of duties. This recommendation applies to organizations with a related compliance requirement."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "information_exchange_policies_and_procedures" {
    title = "Information Exchange Policies and Procedures"

    policy "0662_09scsporganizational_2_09_s" {
      title = "Cloud service providers use an industry-recognized virtualization platform and standard virtualization formats (e.g., Open Virtualization Format, OVF) to help ensure interoperability, and has documented custom changes made to any hypervisor in use and all solution-specific virtualization hooks available for customer review."

      check "1" {
        title       = "Ensure WEB app has 'Client Certificates (Incoming client certificates)' set to 'On'"
        description = "Client certificates allow for the app to request a certificate for incoming requests. Only clients that have a valid certificate will be able to reach the app."
        query       = file("queries/manual.sql")
      }
    }

    policy "0901_09s1organizational_1_09_s" {
      title = "The organization formally addresses multiple safeguards before allowing the use of information systems for information exchange."

      check "1" {
        title       = "CORS should not allow every resource to access your Web Applications"
        description = "Cross-Origin Resource Sharing (CORS) should not allow all domains to access your web application. Allow only required domains to interact with your web app."
        query       = file("queries/manual.sql")
      }
    }

    policy "0902_09s2organizational_13_09_s" {
      title = "Remote (external) access to the organization's information assets and access to external information assets (for which the organization has no control) is based on clearly defined terms and conditions."

      check "1" {
        title       = "CORS should not allow every resource to access your Function Apps"
        description = "Cross-Origin Resource Sharing (CORS) should not allow all domains to access your Function app. Allow only required domains to interact with your Function app."
        query       = file("queries/manual.sql")
      }
    }

    policy "0911_09s1organizational_2_09_s" {
      title = "The organization establishes terms and conditions, consistent with any trust relationship established with other organizations owning, operating, and/or maintaining external information systems, allowing authorized individuals to (i) access the information system from external information systems; and (ii) process, store or transmit organization-controlled information using external information systems."

      check "1" {
        title       = "CORS should not allow every resource to access your API App"
        description = "Cross-Origin Resource Sharing (CORS) should not allow all domains to access your API app. Allow only required domains to interact with your API app."
        query       = file("queries/manual.sql")
      }
    }

    policy "0912_09s1organizational_4_09_s" {
      title = "Cryptography is used to protect the confidentiality and integrity of remote access sessions to the internal network and to external systems."

      check "1" {
        title       = "Remote debugging should be turned off for Web Applications"
        description = "Remote debugging requires inbound ports to be opened on a web application. Remote debugging should be turned off."
        query       = file("queries/manual.sql")
      }
    }

    policy "0913_09s1organizational_5_09_s" {
      title = "Strong cryptography protocols are used to safeguard covered information during transmission over less trusted / open public networks."

      check "1" {
        title       = "Remote debugging should be turned off for Function Apps"
        description = "Remote debugging requires inbound ports to be opened on function apps. Remote debugging should be turned off."
        query       = file("queries/manual.sql")
      }
    }

    policy "0914_09s1organizational_6_09_s" {
      title = "The organization ensures that communication protection requirements, including the security of exchanges of information, is the subject of policy development and compliance audits."

      check "1" {
        title       = "Remote debugging should be turned off for API Apps"
        description = "Remote debugging requires inbound ports to be opened on API apps. Remote debugging should be turned off."
        query       = file("queries/manual.sql")
      }
    }

    policy "0915_09s2organizational_2_09_s" {
      title = "The organization limits the use of organization-controlled portable storage media by authorized individuals on external information systems."

      check "1" {
        title       = "Ensure WEB app has 'Client Certificates (Incoming client certificates)' set to 'On'"
        description = "Client certificates allow for the app to request a certificate for incoming requests. Only clients that have a valid certificate will be able to reach the app."
        query       = file("queries/manual.sql")
      }
    }

    policy "0916_09s2organizational_4_09_s" {
      title = "The information system prohibits remote activation of collaborative computing devices and provides an explicit indication of use to users physically present at the devices."

      check "1" {
        title       = "CORS should not allow every resource to access your Web Applications"
        description = "Cross-Origin Resource Sharing (CORS) should not allow all domains to access your web application. Allow only required domains to interact with your web app."
        query       = file("queries/manual.sql")
      }
    }

    policy "0960_09scsporganizational_1_09_s" {
      title = "Cloud service providers use secure (e.g., non-clear text and authenticated) standardized network protocols for the import and export of data and to manage the service, and make available a document to consumers (tenants) detailing the relevant interoperability and portability standards that are involved."

      check "1" {
        title       = "CORS should not allow every resource to access your Function Apps"
        description = "Cross-Origin Resource Sharing (CORS) should not allow all domains to access your Function app. Allow only required domains to interact with your Function app."
        query       = file("queries/manual.sql")
      }
    }

    policy "1325_09s1organizational_3_09_s" {
      title = "Personnel are appropriately trained on leading principles and practices for all types of information exchange (oral, paper and electronic)."

      check "1" {
        title       = "Remote debugging should be turned off for Function Apps"
        description = "Remote debugging requires inbound ports to be opened on function apps. Remote debugging should be turned off."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "on_line_transactions" {
    title = "On-line Transactions"

    policy "0943_09y1organizational_1_09_y" {
      title = "Data involved in electronic commerce and online transactions is checked to determine if it contains covered information."

      check "1" {
        title       = "Secure transfer to storage accounts should be enabled"
        description = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
        query       = file("queries/manual.sql")
      }
    }

    policy "0945_09y1organizational_3_09_y" {
      title = "Protocols used to communicate between all involved parties are secured using cryptographic techniques (e.g., SSL)."

      check "1" {
        title       = "Audit Windows machines that do not contain the specified certificates in Trusted Root"
        description = "Requires that prerequisites are deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol. Machines are non-compliant if the machine Trusted Root certificate store (Cert:\\LocalMachine\\Root) does not contain one or more of the certificates listed by the policy parameter."
        query       = file("queries/manual.sql")
      }
    }

    policy "0946_09y2organizational_14_09_y" {
      title = "The organization requires the use of encryption between, and the use of electronic signatures by, each of the parties involved in the transaction."

      check "1" {
        title       = "Only secure connections to your Azure Cache for Redis should be enabled"
        description = "Audit enabling of only connections via SSL to Azure Cache for Redis. Use of secure connections ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
        query       = file("queries/manual.sql")
      }
    }

    policy "0947_09y2organizational_2_09_y" {
      title = "The organization ensures the storage of the transaction details are located outside of any publicly accessible environments (e.g., on a storage platform existing on the organization's intranet) and not retained and exposed on a storage medium directly accessible from the Internet."

      check "1" {
        title       = "Enforce SSL connection should be enabled for PostgreSQL database servers"
        description = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
        query       = file("queries/manual.sql")
      }
    }

    policy "0948_09y2organizational_3_09_y" {
      title = "Where a trusted authority is used (e.g., for the purposes of issuing and maintaining digital signatures and/or digital certificates), security is integrated and embedded throughout the entire end-to-end certificate/signature management process."

      check "1" {
        title       = "Enforce SSL connection should be enabled for MySQL database servers"
        description = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
        query       = file("queries/manual.sql")
      }
    }

    policy "0949_09y2organizational_5_09_y" {
      title = "The protocols used for communications are enhanced to address any new vulnerability, and the updated versions of the protocols are adopted as soon as possible."

      check "1" {
        title       = "API App should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "Function App should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }

      check "3" {
        title       = "Latest TLS version should be used in your API App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "4" {
        title       = "Latest TLS version should be used in your Function App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "5" {
        title       = "Latest TLS version should be used in your Web App"
        description = "Upgrade to the latest TLS version"
        query       = file("queries/manual.sql")
      }

      check "6" {
        title       = "Web Application should only be accessible over HTTPS"
        description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "control_of_operational_software" {
    title = "Control of Operational Software"

    policy "0605_10h1system_12_10_h" {
      title = "Only authorized administrators are allowed to implement approved upgrades to software, applications, and program libraries, based on business requirements and the security implications of the release."

      check "1" {
        title       = "Vulnerabilities in security configuration on your machines should be remediated"
        description = "Servers which do not satisfy the configured baseline will be monitored by Azure Security Center as recommendations"
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "Windows machines should meet requirements for 'Security Options_Audit'"
        description = "Windows machines should have the specified Group Policy settings in the category 'Security Options_Audit' for forcing audit policy subcategory and shutting down if unable to log security audits. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }

      check "3" {
        title       = "Windows machines should meet requirements for 'System Audit Policies_Account Management'"
        description = "Windows machines should have the specified Group Policy settings in the category 'System Audit Policies_Account Management' for auditing application, security, and user group management, and other management events. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }

    policy "0606_10h2system_1_10_h" {
      title = "Applications and operating systems are successfully tested for usability, security and impact prior to production."

      check "1" {
        title       = "Vulnerabilities in container security configurations should be remediated"
        description = "Audit vulnerabilities in security configuration on machines with Docker installed and display as recommendations in Azure Security Center."
        query       = file("queries/manual.sql")
      }
    }

    policy "0607_10h2system_23_10_h" {
      title = "The organization uses its configuration control program to maintain control of all implemented software and its system documentation and archive prior versions of implemented software and associated system documentation."

      check "1" {
        title       = "Adaptive application controls for defining safe applications should be enabled on your machines"
        description = "Enable application controls to define the list of known-safe applications running on your machines, and alert you when other applications run. This helps harden your machines against malware. To simplify the process of configuring and maintaining your rules, Security Center uses machine learning to analyze the applications running on each machine and suggest the list of known-safe applications."
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "Vulnerabilities in security configuration on your virtual machine scale sets should be remediated"
        description = "Audit the OS vulnerabilities on your virtual machine scale sets to protect them from attacks."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "change_control_procedures" {
    title = "Change Control Procedures"

    policy "0635_10k1organizational_12_10_k" {
      title = "Managers responsible for application systems are also responsible for the strict control (security) of the project or support environment and ensure that all proposed system changes are reviewed to check that they do not compromise the security of either the system or the operating environment."

      check "1" {
        title       = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        description = "Windows machines should have the specified Group Policy settings in the category 'System Audit Policies_Detailed Tracking' for auditing DPAPI, process creation/termination, RPC events, and PNP activity. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }

    policy "0636_10k2organizational_1_10_k" {
      title = "The organization formally addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance for configuration management (e.g., through policies, standards, processes)."

      check "1" {
        title       = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        description = "Windows machines should have the specified Group Policy settings in the category 'System Audit Policies_Detailed Tracking' for auditing DPAPI, process creation/termination, RPC events, and PNP activity. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }

    policy "0637_10k2organizational_2_10_k" {
      title = "The organization has developed, documented, and implemented a configuration management plan for the information system."

      check "1" {
        title       = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        description = "Windows machines should have the specified Group Policy settings in the category 'System Audit Policies_Detailed Tracking' for auditing DPAPI, process creation/termination, RPC events, and PNP activity. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }

    policy "0638_10k2organizational_34569_10_k" {
      title = "Changes are formally controlled, documented and enforced in order to minimize the corruption of information systems."

      check "1" {
        title       = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        description = "Windows machines should have the specified Group Policy settings in the category 'System Audit Policies_Detailed Tracking' for auditing DPAPI, process creation/termination, RPC events, and PNP activity. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }

    policy "0639_10k2organizational_78_10_k" {
      title = "Installation checklists and vulnerability scans are used to validate the configuration of servers, workstations, devices and appliances and ensure the configuration meets minimum standards."

      check "1" {
        title       = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        description = "Windows machines should have the specified Group Policy settings in the category 'System Audit Policies_Detailed Tracking' for auditing DPAPI, process creation/termination, RPC events, and PNP activity. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }

    policy "0640_10k2organizational_1012_10_k" {
      title = "Where development is outsourced, change control procedures to address security are included in the contract(s) and specifically require the developer to track security flaws and flaw resolution within the system, component, or service and report findings to organization-defined personnel or roles."

      check "1" {
        title       = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        description = "Windows machines should have the specified Group Policy settings in the category 'System Audit Policies_Detailed Tracking' for auditing DPAPI, process creation/termination, RPC events, and PNP activity. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }

    policy "0641_10k2organizational_11_10_k" {
      title = "The organization does not use automated updates on critical systems."

      check "1" {
        title       = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        description = "Windows machines should have the specified Group Policy settings in the category 'System Audit Policies_Detailed Tracking' for auditing DPAPI, process creation/termination, RPC events, and PNP activity. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }

    policy "0642_10k3organizational_12_10_k" {
      title = "The organization develops, documents, and maintains, under configuration control, a current baseline configuration of the information system, and reviews and updates the baseline as required."

      check "1" {
        title       = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        description = "Windows machines should have the specified Group Policy settings in the category 'System Audit Policies_Detailed Tracking' for auditing DPAPI, process creation/termination, RPC events, and PNP activity. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }

    policy "0643_10k3organizational_3_10_k" {
      title = "The organization (i) establishes and documents mandatory configuration settings for information technology products employed within the information system using the latest security configuration baselines; (ii) identifies, documents, and approves exceptions from the mandatory established configuration settings for individual components based on explicit operational requirements; and (iii) monitors and controls changes to the configuration settings in accordance with organizational policies and procedures."

      check "1" {
        title       = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        description = "Windows machines should have the specified Group Policy settings in the category 'System Audit Policies_Detailed Tracking' for auditing DPAPI, process creation/termination, RPC events, and PNP activity. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }

    policy "0644_10k3organizational_4_10_k" {
      title = "The organization employs automated mechanisms to (i) centrally manage, apply, and verify configuration settings; (ii) respond to unauthorized changes to network and system security-related configuration settings; and (iii) enforce access restrictions and auditing of the enforcement actions."

      check "1" {
        title       = "Windows machines should meet requirements for 'System Audit Policies_Detailed Tracking'"
        description = "Windows machines should have the specified Group Policy settings in the category 'System Audit Policies_Detailed Tracking' for auditing DPAPI, process creation/termination, RPC events, and PNP activity. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "control_of_technical_vulnerabilities" {
    title = "Control of Technical Vulnerabilities"

    policy "0709_10m1organizational_1_10_m" {
      title = "Technical vulnerabilities are identified, evaluated for risk and corrected in a timely manner."

      check "1" {
        title       = "A vulnerability assessment solution should be enabled on your virtual machines"
        description = "Audits virtual machines to detect whether they are running a supported vulnerability assessment solution. A core component of every cyber risk and security program is the identification and analysis of vulnerabilities. Azure Security Center's standard pricing tier includes vulnerability scanning for your virtual machines at no extra cost. Additionally, Security Center can automatically deploy this tool for you."
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "SQL databases should have vulnerability findings resolved"
        description = "Monitor vulnerability assessment scan results and recommendations for how to remediate database vulnerabilities."
        query       = file("queries/manual.sql")
      }

      check "3" {
        title       = "Vulnerabilities in container security configurations should be remediated"
        description = "Audit vulnerabilities in security configuration on machines with Docker installed and display as recommendations in Azure Security Center."
        query       = file("queries/manual.sql")
      }

      check "4" {
        title       = "Vulnerabilities in security configuration on your machines should be remediated"
        description = "Servers which do not satisfy the configured baseline will be monitored by Azure Security Center as recommendations"
        query       = file("queries/manual.sql")
      }

      check "5" {
        title       = "Vulnerabilities in security configuration on your virtual machine scale sets should be remediated"
        description = "Audit the OS vulnerabilities on your virtual machine scale sets to protect them from attacks."
        query       = file("queries/manual.sql")
      }

      check "6" {
        title       = "Vulnerability assessment should be enabled on SQL Managed Instance"
        description = "Audit each SQL Managed Instance which doesn't have recurring vulnerability assessment scans enabled. Vulnerability assessment can discover, track, and help you remediate potential database vulnerabilities."
        query       = file("queries/manual.sql")
      }

      check "7" {
        title       = "Vulnerability assessment should be enabled on your SQL servers"
        description = "Audit Azure SQL servers which do not have recurring vulnerability assessment scans enabled. Vulnerability assessment can discover, track, and help you remediate potential database vulnerabilities."
        query       = file("queries/manual.sql")
      }

      check "8" {
        title       = "Windows machines should meet requirements for 'Security Options_Microsoft Network Server'"
        description = "Windows machines should have the specified Group Policy settings in the category 'Security Options_Microsoft Network Server' for disabling SMB v1 server. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }

    policy "0710_10m2organizational_1_10_m" {
      title = "A hardened configuration standard exists for all system and network components."

      check "1" {
        title       = "Vulnerability assessment should be enabled on SQL Managed Instance"
        description = "Audit each SQL Managed Instance which doesn't have recurring vulnerability assessment scans enabled. Vulnerability assessment can discover, track, and help you remediate potential database vulnerabilities."
        query       = file("queries/manual.sql")
      }
    }

    policy "0711_10m2organizational_23_10_m" {
      title = "A technical vulnerability management program is in place to monitor, assess, rank, and remediate vulnerabilities identified in systems."

      check "1" {
        title       = "A vulnerability assessment solution should be enabled on your virtual machines"
        description = "Audits virtual machines to detect whether they are running a supported vulnerability assessment solution. A core component of every cyber risk and security program is the identification and analysis of vulnerabilities. Azure Security Center's standard pricing tier includes vulnerability scanning for your virtual machines at no extra cost. Additionally, Security Center can automatically deploy this tool for you."
        query       = file("queries/manual.sql")
      }
    }

    policy "0713_10m2organizational_5_10_m" {
      title = "Patches are tested and evaluated before they are installed."

      check "1" {
        title       = "Vulnerabilities in security configuration on your machines should be remediated"
        description = "Servers which do not satisfy the configured baseline will be monitored by Azure Security Center as recommendations"
        query       = file("queries/manual.sql")
      }
    }

    policy "0714_10m2organizational_7_10_m" {
      title = "The technical vulnerability management program is evaluated on a quarterly basis."

      check "1" {
        title       = "Vulnerabilities in security configuration on your virtual machine scale sets should be remediated"
        description = "Audit the OS vulnerabilities on your virtual machine scale sets to protect them from attacks."
        query       = file("queries/manual.sql")
      }
    }

    policy "0715_10m2organizational_8_10_m" {
      title = "Systems are appropriately hardened (e.g., configured with only necessary and secure services, ports and protocols enabled)."

      check "1" {
        title       = "Vulnerabilities in container security configurations should be remediated"
        description = "Audit vulnerabilities in security configuration on machines with Docker installed and display as recommendations in Azure Security Center."
        query       = file("queries/manual.sql")
      }
    }

    policy "0716_10m3organizational_1_10_m" {
      title = "The organization conducts an enterprise security posture review as needed but no less than once within every three-hundred-sixty-five (365) days, in accordance with organizational IS procedures."

      check "1" {
        title       = "SQL databases should have vulnerability findings resolved"
        description = "Monitor vulnerability assessment scan results and recommendations for how to remediate database vulnerabilities."
        query       = file("queries/manual.sql")
      }
    }

    policy "0717_10m3organizational_2_10_m" {
      title = "Vulnerability scanning tools include the capability to readily update the information system vulnerabilities scanned."

      check "1" {
        title       = "Vulnerabilities in security configuration on your virtual machine scale sets should be remediated"
        description = "Audit the OS vulnerabilities on your virtual machine scale sets to protect them from attacks."
        query       = file("queries/manual.sql")
      }
    }

    policy "0718_10m3organizational_34_10_m" {
      title = "The organization scans for vulnerabilities in the information system and hosted applications to determine the state of flaw remediation monthly (automatically) and again (manually or automatically) when new vulnerabilities potentially affecting the systems and networked environments are identified and reported."

      check "1" {
        title       = "Vulnerabilities in security configuration on your machines should be remediated"
        description = "Servers which do not satisfy the configured baseline will be monitored by Azure Security Center as recommendations"
        query       = file("queries/manual.sql")
      }
    }

    policy "0719_10m3organizational_5_10_m" {
      title = "The organization updates the list of information system vulnerabilities scanned within every thirty (30) days or when new vulnerabilities are identified and reported."

      check "1" {
        title       = "Vulnerability assessment should be enabled on SQL Managed Instance"
        description = "Audit each SQL Managed Instance which doesn't have recurring vulnerability assessment scans enabled. Vulnerability assessment can discover, track, and help you remediate potential database vulnerabilities."
        query       = file("queries/manual.sql")
      }
    }
  }

  policy "business_continuity_and_risk_assessment" {
    title = "Business Continuity and Risk Assessment"

    policy "1634_12b1organizational_1_12_b" {
      title = "The organization identifies the critical business processes requiring business continuity."

      check "1" {
        title       = "Audit virtual machines without disaster recovery configured"
        description = "Audit virtual machines which do not have disaster recovery configured. To learn more about disaster recovery, visit https://aka.ms/asr-doc."
        query       = file("queries/manual.sql")
      }
    }

    policy "1635_12b1organizational_2_12_b" {
      title = "Information security aspects of business continuity are (i) based on identifying events (or sequence of events) that can cause interruptions to the organization's critical business processes (e.g., equipment failure, human errors, theft, fire, natural disasters acts of terrorism); (ii) followed by a risk assessment to determine the probability and impact of such interruptions, in terms of time, damage scale and recovery period; (iii) based on the results of the risk assessment, a business continuity strategy is developed to identify the overall approach to business continuity; and (iv) once this strategy has been created, endorsement is provided by management, and a plan created and endorsed to implement this strategy."

      check "1" {
        title       = "Azure Key Vault Managed HSM should have purge protection enabled"
        description = "Malicious deletion of an Azure Key Vault Managed HSM can lead to permanent data loss. A malicious insider in your organization can potentially delete and purge Azure Key Vault Managed HSM. Purge protection protects you from insider attacks by enforcing a mandatory retention period for soft deleted Azure Key Vault Managed HSM. No one inside your organization or Microsoft will be able to purge your Azure Key Vault Managed HSM during the soft delete retention period."
        query       = file("queries/manual.sql")
      }

      check "2" {
        title       = "Key vaults should have purge protection enabled"
        description = "Malicious deletion of a key vault can lead to permanent data loss. A malicious insider in your organization can potentially delete and purge key vaults. Purge protection protects you from insider attacks by enforcing a mandatory retention period for soft deleted key vaults. No one inside your organization or Microsoft will be able to purge your key vaults during the soft delete retention period."
        query       = file("queries/manual.sql")
      }
    }

    policy "1637_12b2organizational_2_12_b" {
      title = "Business impact analysis are used to evaluate the consequences of disasters, security failures, loss of service, and service availability."

      check "1" {
        title       = "Windows machines should meet requirements for 'Security Options_Recovery console'"
        description = "Windows machines should have the specified Group Policy settings in the category 'Security Options_Recovery console' for allowing floppy copy and access to all drives and folders. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
        query       = file("queries/manual.sql")
      }
    }

    policy "1638_12b2organizational_345_12_b" {
      title = "Business continuity risk assessments (i) are carried out annually with full involvement from owners of business resources and processes; (ii) consider all business processes and is not limited to the information assets, but includes the results specific to information security; and (iii) identifies, quantifies, and prioritizes risks against key business objectives and criteria relevant to the organization, including critical resources, impacts of disruptions, allowable outage times, and recovery priorities."

      check "1" {
        title       = "Audit virtual machines without disaster recovery configured"
        description = "Audit virtual machines which do not have disaster recovery configured. To learn more about disaster recovery, visit https://aka.ms/asr-doc."
        query       = file("queries/manual.sql")
      }
    }
  }
}
