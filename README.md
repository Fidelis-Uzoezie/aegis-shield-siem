# Aegis Shield: Production Secrets Vault & Runtime SIEM

An enterprise-grade repository demonstrating production runtime threat detection architectures, automated logging provisioning, and zero-git secret distribution configurations.

## Architecture Data Flow
```text
[ AWS GuardDuty / CloudTrail ] ──► [ Python SIEM Script ] ──► [  Auto-Generate Jira Ticket ]
                                                                             
[ AWS Secrets Manager ]        ──► [ ClusterSecretStore ]  ──► [ External Secrets Operator ]
                                                                              │
                                                                              ▼
                                                                 [ Safe RAM App Ingestion ]
```

## How the Components Work
* **Zero-Git Secret Architecture (`kubernetes/`):** Implements ClusterSecretStore and ExternalSecret specifications to ingest sensitive database credentials dynamically at runtime using the **External Secrets Operator (ESO)**. This eliminates plain-text security keys inside source control files entirely.
* **Infrastructure Monitoring-as-Code (`terraform/`):** Uses Terraform configurations to automatically provision AWS CloudTrail audit logs and trigger Amazon GuardDuty runtime intrusion detection across active clusters.
* **Automated Incident Orchestration (`scripts/`):** Features a specialized Python script that aggregates critical GuardDuty threat telemetry, processes event logs, and programmatically models how cloud threat data maps straight to engineering ticket tracking boards (Jira).
