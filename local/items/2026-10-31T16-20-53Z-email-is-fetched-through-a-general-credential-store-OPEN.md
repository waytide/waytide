# Email is fetched through a general mechanism, with a general token or credential store

- **State:** Open
- **Tags:** [idea]

**A general way to fetch email, which is not tied to one provider, reads its access from a general store of tokens or credentials.** The store serves the email fetch, and is not specific to it.

**Not yet settled:**

- what the fetched email is for
- which providers and protocols the fetch covers
- where the store lives, which is outside any repository, as per-machine configuration is, so that no credential is committed

## History

As the engineer first stated it: "Idea: generalized email fetch with generalized token or credential store"

---

Authored by Scott Bellware on Sat Oct 31 2026 at 9:20:53 AM PT
