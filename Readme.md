### Spin Up Docker Test Db
1. ``cd docker``
2. ```docker build -t test-db .```
3. ```docker run -d -p 3304:3306 --name nasa_space_exploration_database test-db```

After running the above commands, you should be able to access the database at: ```localhost:3304```
