# "sent to" phrasing for method/initializer inputs

When describing a value that is passed into a method or an initializer — in test descriptions and in prose generally — phrase it as the value being **sent to** that method/initializer. For example: "the value **sent to the initializer**", not "the instance was **initialized with**" or "the value **passed to** the initializer".

**Why:** "sent to" frames a call as sending a message with arguments — an argument is *sent to* the method that receives it. It states the relationship directly and consistently, where "initialized with" and "passed to" are looser, more mechanism-flavored phrasings for the same thing.

**How to apply:** in test descriptions and prose, say a value is "sent to" the method or initializer that receives it. Related: the name-literally-not-by-analogy rule.
