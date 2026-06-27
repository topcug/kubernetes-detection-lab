# kubernetes-detection-lab

Open detection content for Kubernetes and cloud-native security teams. Each lab covers one real threat scenario: what it looks like at runtime, why it matters, how to detect it, how to triage the alert, and how to remediate the underlying condition. All content is MIT licensed and designed to be used directly, not just read.

## Repository structure

```
labs/           — Detection labs (one folder per scenario)
falco-rules/    — Standalone Falco rules, ready to load
sigma-rules/    — Sigma-format detection specs for SIEM portability
docs/           — Setup guides and supporting documentation
```

## Labs

| Lab | Threat | MITRE | Severity |
|-----|--------|-------|----------|
| [LAB-001](labs/lab-001-shell-in-container/) | Shell spawned in container | T1059 | High |
| [LAB-002](labs/lab-002-privileged-container/) | Privileged container started | T1611 | Critical |
| [LAB-003](labs/lab-003-cryptominer-detection/) | Cryptominer process detected | T1496 | Critical |
| [LAB-004](labs/lab-004-sensitive-file-read/) | Sensitive file read (/etc/shadow, SA token) | T1552 | High |
| [LAB-005](labs/lab-005-kubectl-exec/) | kubectl exec into running container | T1609 | High |
| [LAB-006](labs/lab-006-reverse-shell/) | Reverse shell from container | T1059 | Critical |
| [LAB-007](labs/lab-007-data-exfiltration/) | Data exfiltration via curl/wget | T1041 | High |
| [LAB-008](labs/lab-008-secret-enumeration/) | Kubernetes Secret enumeration via API | T1552.007 | Critical |
| [LAB-009](labs/lab-009-privilege-escalation/) | Privilege escalation via setuid binary | T1548 | High |
| [LAB-010](labs/lab-010-mutable-image-tag/) | Container running from mutable image tag | T1525 | Medium |
| [LAB-011](labs/lab-011-unexpected-outbound-connection/) | Unexpected outbound network connection | T1071 | High |
| [LAB-012](labs/lab-012-host-path-escape/) | Container escape via host path mount | T1611 | Critical |
| [LAB-013](labs/lab-013-sqli-detection/) | SQL injection detection with Zeek, Falco, and Sigma | T1190 | High |

## How to use a lab

Each lab folder contains a README with the threat scenario, attack simulation steps, a Falco detection rule, a triage guide, remediation steps, and false positive notes.

To load a single Falco rule:

```bash
falco -r falco-rules/shell-in-container.yaml
```

To convert a Sigma rule to your SIEM format:

```bash
sigma convert -t splunk sigma-rules/shell-in-container.yml
sigma convert -t elastic-dsl sigma-rules/shell-in-container.yml
```

## Requirements

- Kubernetes cluster (kind, k3s, minikube, or any managed cluster)
- [Falco](https://falco.org/docs/getting-started/) installed as a DaemonSet or in eBPF mode
- `kubectl` access to your test cluster
- Optional: Kubernetes audit logging enabled for API-level detections

## MITRE ATT&CK coverage

Labs map to the [MITRE ATT&CK Containers matrix](https://attack.mitre.org/matrices/enterprise/containers/).

| Tactic | Techniques covered |
|--------|--------------------|
| Execution | T1059, T1609 |
| Persistence | T1525 |
| Privilege Escalation | T1548, T1611 |
| Credential Access | T1552, T1552.007 |
| Exfiltration | T1041 |
| Command and Control | T1071 |
| Impact | T1496 |
| Initial Access | T1190 |

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for how to add a lab or suggest a change.

## License

[MIT](./LICENSE)
