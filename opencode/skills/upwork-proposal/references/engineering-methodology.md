# Engineering Methodology

Spec-Driven Development (SDD) + Test-Driven Development (TDD) workflow.

This is a **trust differentiator** - most freelancers just generate code with AI. You deliver engineer-grade, documented, tested solutions.

---

## Why This Matters to Clients

| Client Pain | Your Solution |
|-------------|---------------|
| "Last freelancer's code broke after a week" | Tests verify it works, specs document expected behavior |
| "I don't understand what was built" | ADRs explain decisions, specs describe functionality |
| "Can't maintain or extend the code" | Self-documenting code, clear structure, test coverage |
| "How do I know it's not just AI-generated garbage?" | Specs written BEFORE code, tests validate behavior |

---

## Your Development Workflow

### Phase 1: Specify
- Gather requirements from client
- Write specification document (what it does, edge cases, expected behavior)
- Client reviews/approves spec BEFORE coding starts

### Phase 2: Plan
- Define architecture and technical approach
- Create ADR (Architecture Decision Record) for key decisions
- Break into tasks

### Phase 3: Test First (TDD)
- Write tests BEFORE implementation
- Tests define expected behavior
- Confirm tests fail (validates they target the right thing)

### Phase 4: Implement
- Code against the spec and tests
- Tests pass = verified working
- Self-documenting code with clear naming

### Phase 5: Deliver
- All artifacts in repo: specs, tests, ADRs, docs
- Client can verify, maintain, and extend

---

## Deliverables Structure

```
project/
├── specs/
│   ├── phase-1-requirements.md
│   ├── phase-2-technical-plan.md
│   └── ...
├── docs/
│   └── ADRs/
│       ├── 001-database-choice.md
│       ├── 002-api-structure.md
│       └── ...
├── tests/
│   ├── test_main.py
│   ├── test_integrations.py
│   └── ...
├── src/
│   └── [self-documenting code]
└── README.md
```

---

## Tools Used

| Tool | Purpose |
|------|---------|
| **Claude Code** | AI-assisted development with human oversight |
| **Spec-kit-plus** | Specification generation and management |
| **Pytest** | Test framework (tests written FIRST) |
| **ADRs** | Document architecture decisions |

---

## When to Mention in Proposals

### DO mention for:
- Complex projects with multiple integrations
- Long-term/ongoing work
- Clients who value reliability ("production-ready", "maintainable")
- Higher-budget projects ($500+)
- Clients who've been burned before ("last freelancer didn't document anything")
- Enterprise or business-critical systems

### DON'T mention for:
- Simple one-off tasks
- Quick fixes under $100
- Clients who just want "fast and cheap"
- Prototype/MVP where speed > quality

---

## Proposal Phrases

### Full mention (for quality-focused clients):
```
I follow spec-driven development — I document requirements first, write
tests before code, then implement. You'll get working code plus specs,
tests, and ADRs in the repo. Not just "it works on my machine."
```

### Medium mention (for most professional projects):
```
I write specs and tests first, so you get reliable, documented code
you can actually maintain and extend.
```

### Brief mention (just a trust signal):
```
All deliverables include specs, tests, and documentation in the repo.
```

### When client mentions reliability concerns:
```
I use test-driven development — tests are written before code, so
everything is verified working, not just "looks right."
```

### When client mentions past bad experiences:
```
I document everything: specs before coding, ADRs for decisions, tests
for verification. You'll understand exactly what was built and why.
```

---

## Example: How It Changes a Proposal

### Without methodology (standard):
```
Hey there 👋

I can build your Google Sheets → AI → PDF automation in n8n.

Here's my approach:
- Connect Sheets with triggers
- Process through ChatGPT
- Generate PDF and email

I've built similar workflows before. When would you like to start?
```

### With methodology (for quality-focused client):
```
Hey there 👋

I can build your Google Sheets → AI → PDF automation in n8n.

Here's my approach:
- Connect Sheets with scheduled triggers
- Process through ChatGPT API
- Generate PDF and auto-email

I follow spec-driven development — I'll document requirements first,
write tests, then implement. You'll get the workflow plus specs and
tests in the repo, so it's maintainable long-term.

When would you like to kick off?
```

**Note:** Only ~20 extra words, but signals professionalism and reliability.

---

## Handling Questions

**Client: "What's spec-driven development?"**
```
I write a clear specification of what the system should do before coding.
Then I write tests that verify the behavior. Then I implement. This means
you get documented, tested code — not just "it seems to work."
```

**Client: "Isn't that overkill for a small project?"**
```
For a simple one-off, yes. But if you want to maintain or extend this
later, having specs and tests saves hours of "what does this do?" later.
```

**Client: "Do you use AI for coding?"**
```
Yes, I use Claude Code as an assistant, but I drive the architecture
and review everything. The specs and tests ensure the output is correct,
not just AI-generated guesswork.
```
