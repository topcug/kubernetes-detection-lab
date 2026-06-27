# Contributing

Thanks for your interest. Contributions that add new labs, improve existing detection content, or fix references are welcome.

## What fits

A new lab covering a real, reproducible threat scenario in the Kubernetes or cloud-native runtime space, improvements to existing Falco or Sigma rules, corrections to triage guides or remediation steps, and additional references tied directly to a lab topic.

## What does not fit

General Kubernetes tutorials, web application detection content unrelated to container or cluster runtime behavior, and contributions that require access to paid or external services to reproduce.

## How to contribute

For a new lab, open an issue first with a short description of the threat scenario you want to cover. For smaller changes like fixing a rule, correcting a triage step, or updating a reference, a pull request is fine without an issue.

## Lab format

Copy `labs/_template/`, fill in all sections of the README, add a Falco rule to `falco-rules/`, add a Sigma rule to `sigma-rules/` if the detection applies to a SIEM backend, and open a PR with a clear description of the threat scenario and its MITRE ATT&CK mapping.

The lab should be reproducible locally with kind, k3s, or minikube. If a managed cluster is needed to demonstrate something meaningful, document a way to simulate the relevant behavior locally as well.

## Scope and ethics

All labs are for local and authorized research only. Contributions should not include content that facilitates unauthorized access to real systems, and any techniques demonstrated should be publicly documented in the security community.
