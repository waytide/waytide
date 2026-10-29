# A plugin's namespace is its manifest name, and no registry makes it unique across marketplaces — found for the Waytide skills item

**Tags:** [finding]

Nothing was decided and nothing was built. Source: https://code.claude.com/docs/en/plugins/loading.md, under "Entry name and manifest name" and "Name conflicts".

1. A plugin's commands and skills are namespaced under the `name` in its manifest, as `/<name>:<command>`. The entry name in a marketplace's `marketplace.json` can differ from it, and does not set the namespace. A plugin has one namespace and no alias.
2. Two enabled plugins with the same manifest name are not namespaced apart. One loads, in this order of precedence: one that managed settings turn on or off, then a session-only plugin, then a marketplace plugin, then a skills-directory plugin, then a plugin synced from claude.ai. Most of the others show as "Not loaded" in the `/plugin` Errors tab. Two marketplace copies of one name both load, and one copy's hooks do not run.
3. No central registry exists. A marketplace is any repository or URL with a `marketplace.json`. Whether a name such as `wt` or `wtd` is taken can be checked only in the marketplaces that can be seen, and only by reading each plugin's manifest.
4. A clash costs something only where one engineer has both plugins enabled. A distinctive name, such as `waytide`, makes one less likely.
