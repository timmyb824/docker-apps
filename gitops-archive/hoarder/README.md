# Importing Links

Put one link per line and use this command to import them:

```bash
cat links.txt | xargs -I{} hoarder --api-key ak1.... --server-addr https://hoarder.example.com bookmarks add --link {}
```
