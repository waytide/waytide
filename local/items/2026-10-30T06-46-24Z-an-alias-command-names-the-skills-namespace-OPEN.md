# An alias command names the namespace the Waytide skills are typed under

- **State:** Open
- **Tags:** [idea]

**`/alias <alias-name>` sets a namespace of the engineer's choosing for the Waytide skills**, so that `/alias wt` would have them typed as `/wt:item`, `/wt:log`, and so on. It belongs with the item `2026-10-29T16-24-42Z-waytide-skills`.

**What the namespace is today.** A plugin's commands are namespaced under the `name` in its manifest, and a plugin has one namespace and no alias, per the log entry `2026-10-29T20-53-01Z-a-plugin-namespace-is-its-manifest-name-and-is-not-unique-across-marketplaces`. Two enabled plugins with the same manifest name are not namespaced apart.

**Not yet settled:**

- how the namespace is generated: by rewriting the plugin's manifest name on this machine, or by generating skills under a second name that call the Waytide ones
- where the chosen name is kept, such as per-machine configuration under `~/.config/waytide/`
- what happens when the chosen name is already a namespace on the machine

## History

As the engineer first stated it: "Idea: “/alias <alias-name>” generates an arbitrary namespace for the waytide skills"

---

Authored by Scott Bellware on Thu Oct 29 2026 at 11:46:24 PM PT
