---
name: conventional-commits
description: Use when creating or reviewing Git commits to follow Conventional Commits v1.0.0. Ensures structured, clear, automation-friendly commit messages.
---

# Conventional Commits (v1.0.0)

Structured commit format for readable history and tooling support.

---

## Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

Example:

```
feat(api): add JWT authentication
fix: resolve memory leak
docs(readme): update setup instructions
```

---

## Types

Primary:

* **feat** – new feature
* **fix** – bug fix
* **docs** – documentation only
* **style** – formatting, no logic change
* **refactor** – code change, no feature/bug
* **perf** – performance improvement
* **test** – tests added/updated
* **chore** – maintenance, deps, tooling

Additional:

* **build** – build system changes
* **ci** – CI config
* **revert** – revert commit

---

## Scope (Optional)

Identifies affected area:
`auth`, `api`, `ui`, `db`, `services`, `jobs`, `tests`, `deps`, `config`, `docs`.

Example:

```
fix(auth): handle expired tokens
```

---

## Description Rules

* Imperative, present tense (`add`, not `added`)
* Lowercase first letter
* No trailing period
* ≤72 chars (≤50 ideal)
* Specific and concise

Good:

```
add password reset endpoint
```

Bad:

```
Added password reset endpoint.
```

---

## Body (Optional)

Use for:

* Complex logic
* Design decisions
* Breaking changes
* Migration notes

Rules:

* Blank line after description
* Wrap ~72 chars
* Explain **why**, not what

---

## Footers (Optional)

### Breaking Changes

```
feat(api)!: change auth flow
```

or

```
BREAKING CHANGE: auth endpoint requires client_id
```

### Issue References

```
Fixes #123
Closes #456
Related to #789
```

### Co-authors

```
Co-authored-by: Name <email>
```

---

## Best Practices

**Do**

* One logical change per commit
* Reference issues in footer
* Keep commits atomic
* Keep description concise

**Don’t**

* Use vague messages
* Combine unrelated changes
* Capitalize or end description with period
* Commit broken code

---

## Core Formula

```
<type>(<scope>): <description>

[body]

[footer]
```