# Contributing to CeloHT DAO Layer

This guide ensures all contributions follow CeloHT DAO governance and maintain code quality.

## 1. Fork the Repository
- Fork the official repo to your personal GitHub account before making any changes.

## 2. Branch Naming
- Use descriptive branch names for clarity:  
  - **Features:** `feature/<short-description>`  
  - **Bug Fixes:** `fix/<short-description>`  
- Do not work directly on the `main` branch.

## 3. Commit Messages
- Write clear, concise, and descriptive commit messages.  
- Include references to relevant issues or proposals when applicable.  
- Follow the format: `[CATEGORY] Short description` (e.g., `[FEATURE] Add DAO voting module`).

## 4. Make Changes & Add Tests
- Implement your feature or fix on your branch.  
- Include automated tests for any new functionality.  
- Ensure all existing tests pass before submitting a PR.

## 5. Pull Request (PR)
- Open a PR against the `main` branch.  
- Include a clear description of changes, rationale, and any related proposals or issues.  
- Request **at least 2 approvals** from DAO reviewers.

## 6. Continuous Integration (CI)
- CI will automatically run all tests on your PR.  
- Fix any failing tests before your PR can be merged.

## 7. Merging
- Once the PR has passed CI checks and received required approvals, it can be merged according to DAO governance rules.  
- Squash commits if necessary to maintain a clean history.

## 8. Additional Guidelines
- Follow DAO coding standards and security best practices.  
- Avoid introducing any admin keys or backdoors.  
- Ensure changes are transparent and auditable by the community.