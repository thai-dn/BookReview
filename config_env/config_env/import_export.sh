# in docker: To export DB
# su postgres
# pg_dump book-review > dump.sql

# To Import DB to heroku
# psql `heroku config --app rails-book-review| grep DATABASE_URL | sed 's/DATABASE_URL: //g'` < ../Book-Review/dump.sql

# To dump DB from Heroku
# pg_dump postgres://qcxxecfvnwmvou:449b51a1760c8bcea4104626aa6055218f2686e6f68cc17e372c2c37d3f63890@ec2-54-197-232-203.compute-1.amazonaws.com:5432/de5tb7p4j2p9fd > dump.sql
